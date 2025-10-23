import 'dart:io';
import 'package:notepad/models/notes_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  ///singletone
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  static final String table_note = 'note';
  static final String column_note_sno = 's_no';
  static final String column_note_title = 'title';
  static final String column_note_description = 'desc';
  static final String column_note_createdAt = 'createdAt';

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
        db.execute(
          "create table $table_note ($column_note_sno integer primary key autoincrement , $column_note_title text, $column_note_description text, $column_note_createdAt INTEGER)",
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

    int rowsEffected = await db.insert(table_note, note.toMap());

    return rowsEffected > 0;
  }

  ///Reading all Notes
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(table_note);

    return mData;
  }

  /// Updated Note
  Future<bool> updateNote(NotesModel note) async {
    final db = await getDB();

    int rowsEffected = await db.update(
      table_note,
      note.toMap(),
      where: '$column_note_sno = ?',
      whereArgs: [note.sNo],
    );

    return rowsEffected > 0;
  }

  ////delete Note
  Future<bool> deleteNote({required int s_no}) async {
    final db = await getDB();

    int rowsEffected = await db.delete(
      table_note,
      where: '$column_note_sno = $s_no',
    );

    return rowsEffected > 0;
  }
}
