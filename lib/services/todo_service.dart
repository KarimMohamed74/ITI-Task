import 'package:dio/dio.dart';
import 'package:iti_course_task/models/todo_model.dart';

class TodoListService {
  String url = 'https://jsonplaceholder.typicode.com/todos';
  Future<List<TodoListModel>> getTodoListService() async {
    List<TodoListModel> todoList = [];
    Response response = await Dio().get(url);
    var data = response.data;
    data.forEach((value) {
      TodoListModel todoModel = TodoListModel.fromJson(value);
      todoList.add(todoModel);
    });
    return todoList;
  }
}
