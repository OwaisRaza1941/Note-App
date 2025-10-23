class NotesModel {
  int? sNo;
  String? title;
  String? description;
  int? createdAt;

  NotesModel({this.sNo, this.title, this.description, this.createdAt});

  ///JSON convert TO ---->> NoteModel
  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      sNo: map['s_no'],
      title: map['title'],
      description: map['desc'],
      createdAt: map['createdAt'],
    );
  }

  /// NoteModel convert TO ---->>JSON
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (sNo != null) {
      data['s_no'] = sNo;
    }

    data['title'] = title;
    data['desc'] = description;
    data['createdAt'] = createdAt;

    return data;
  }
}
