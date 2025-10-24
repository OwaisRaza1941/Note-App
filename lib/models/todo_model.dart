class TodoModel {
  int? id;
  String? task;
  String? content;
  int? isComplete;
  int? createdAt;

  TodoModel({
    this.id,
    this.task,
    this.content,
    this.isComplete,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = <String, dynamic>{};

    if (id != null) {
      data['id'] = id;
    }
    data['task'] = task;
    data['content'] = content;
    data['isComplete'] = isComplete;
    data['createdAt'] = createdAt;

    return data;
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      task: map['task'],
      content: map['content'],
      isComplete: map['isComplete'],
      createdAt: map['createdAt'],
    );
  }
}
