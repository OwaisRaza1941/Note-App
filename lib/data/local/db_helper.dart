import 'dart:io';
import 'package:notepad/models/notes_model.dart';
import 'package:notepad/models/todo_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelperKeys {
  // Notes Table
  static const String table_note = 'notes_table';
  static const String column_note_sno = 's_no';
  static const String column_note_title = 'title';
  static const String column_note_description = 'desc';
  static const String column_note_createdAt = 'createdAt';

  // Todo Table
  static const String table_todo = 'todo_table';
  static const String todo_column_id = 'id';
  static const String todo_column_title = 'task';
  static const String todo_column_content = 'content';
  static const String todo_column_isComplete = 'isComplete';
  static const String todo_column_createdAt = 'createdAt';
}

class DBHelper {
  ///singletone
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  Database? myDB;

  /// if exite then create (and open)
  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB = await openDB();
      return myDB!;
    }
  }

  ///OEPN Database
  Future<Database> openDB() async {
    Directory dir = await getApplicationDocumentsDirectory();

    String dbPath = join(dir.path, 'note.db');

    return await openDatabase(
      dbPath,
      onCreate: (db, version) {
        /// create all your tables here

        // Note Table
        db.execute(
          "create table ${DBHelperKeys.table_note} (${DBHelperKeys.column_note_sno} integer primary key autoincrement , ${DBHelperKeys.column_note_title} text, ${DBHelperKeys.column_note_description} text, ${DBHelperKeys.column_note_createdAt} INTEGER)",
        );

        // Todo Table
        db.execute(
          "CREATE TABLE ${DBHelperKeys.table_todo} ("
          "${DBHelperKeys.todo_column_id} INTEGER PRIMARY KEY AUTOINCREMENT, "
          "${DBHelperKeys.todo_column_title} TEXT, "
          "${DBHelperKeys.todo_column_content} TEXT, "
          "${DBHelperKeys.todo_column_isComplete} INTEGER DEFAULT 0, "
          "${DBHelperKeys.todo_column_createdAt} INTEGER)",
        );

        ///
        ///
        ///
        ///
        ///
      },
      version: 1,
    );
  }

  ///All queries

  ///insertion
  Future<bool> addNote(NotesModel note) async {
    final db = await getDB();

    int rowsEffected = await db.insert(DBHelperKeys.table_note, note.toMap());

    return rowsEffected > 0;
  }

  ///Reading all Notes
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(DBHelperKeys.table_note);

    return mData;
  }

  /// Updated Note
  Future<bool> updateNote(NotesModel note) async {
    final db = await getDB();

    int rowsEffected = await db.update(
      DBHelperKeys.table_note,
      note.toMap(),
      where: '${DBHelperKeys.column_note_sno}= ?',
      whereArgs: [note.sNo],
    );

    return rowsEffected > 0;
  }

  ////delete Note
  Future<bool> deleteNote({required int s_no}) async {
    final db = await getDB();

    int rowsEffected = await db.delete(
      DBHelperKeys.table_note,
      where: '${DBHelperKeys.column_note_sno} = $s_no',
    );

    return rowsEffected > 0;
  }

  // --- Todo CRUD --- //

  /// insertion
  Future<bool> addTodo(TodoModel todo) async {
    final db = await getDB();

    int rowsEffected = await db.insert(DBHelperKeys.table_todo, todo.toMap());

    return rowsEffected > 0;
  }

  ///Reading all Todo
  Future<List<Map<String, dynamic>>> getAllTodos() async {
    final db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(DBHelperKeys.table_todo);

    return mData;
  }

  /// updated Todo
  Future<bool> updatedTodo(TodoModel todo) async {
    final db = await getDB();

    int rowsEffected = await db.update(
      DBHelperKeys.table_todo,
      todo.toMap(),
      where: '${DBHelperKeys.todo_column_id} = ? ',
      whereArgs: [todo.id],
    );

    return rowsEffected > 0;
  }

  /// delete Todo
  Future<bool> deleteTodo({required int id}) async {
    final db = await getDB();

    int rowsEffected = await db.delete(
      DBHelperKeys.table_todo,
      where: '${DBHelperKeys.todo_column_id} = ?',
      whereArgs: [id],
    );

    return rowsEffected > 0;
  }
}
