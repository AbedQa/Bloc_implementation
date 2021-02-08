import 'package:bloc_app/models/todos.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class TodoRepo {

  Future<List<Todo>> getTodo() async {
    var toDoApi = await http.get('https://jsonplaceholder.typicode.com/todos');
    if (toDoApi.statusCode != 200) {
      throw Exception();
    }
    return getListToDos(toDoApi.body);
  }

  List<Todo> getListToDos(String response) {
    return toDoFromJson(response);
  }
}