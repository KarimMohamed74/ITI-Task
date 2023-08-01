import 'dart:convert';

List<TodoListModel> todoModelFromJson(String str) => List<TodoListModel>.from(
    json.decode(str).map((x) => TodoListModel.fromJson(x)));

String todoModelToJson(List<TodoListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoListModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoListModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
