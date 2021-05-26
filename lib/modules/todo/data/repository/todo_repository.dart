import 'dart:convert';

import 'package:gardamedicatest/shared/config.dart';
import 'package:gardamedicatest/shared/helper/helper.dart';

import '../models/todos.dart';

class TodoRepository {
  final Network network = Network();
  Future<List<Todo>> getTodos() async {
    var url = "${Config.baseEndpoint}/${Config.todos}";
    print(url);
    final response = await network.getRequest(
      url,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      return todoFromJson(response.body);
    } else {
      print(response.body);
      return null;
    }
  }

  Future<Todo> addTodo(Todo todo) async {
    var url = "${Config.baseEndpoint}/${Config.todos}";
    final response = await network.postRequest(url, todo.toJsonWithID());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Todo.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      return null;
    }
  }

  Future<Todo> updateTodo(Todo todo) async {
    var url = "${Config.baseEndpoint}/${Config.todos}/${todo.id}";
    final response = await network.putRequest(url, todo.toJson());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Todo.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      return null;
    }
  }

  Future<bool> deleteTodo(String id) async {
    var url = "${Config.baseEndpoint}/${Config.todos}/${id}";
    final response = await network.delRequest(
      url,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}
