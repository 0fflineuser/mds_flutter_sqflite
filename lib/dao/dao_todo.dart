import 'package:flutter/material.dart';
import 'package:flutter_sqflite/model/model_todo.dart';
import 'package:sqflite/sqflite.dart';

class DaoTodo {
  late Database database;

  DaoTodo({required this.database});

  /* insert a todo in the database and returns it's inserted id */
  Future<int> createTodo(ModelTodo todo) async {
    debugPrint(todo.title);
    return await database.rawInsert(
        "INSERT INTO TODO (todo_title, todo_content) "
        "VALUES ( ? , ? ) ",
        [todo.title, todo.content]);
  }

  /* select all the todo from the database and returns them as a list  */
  Future<List<ModelTodo>> getTodos() async {
    var queryResults = await database
        .query("TODO", columns: ["todo_id", "todo_title", "todo_content"]);
    List<ModelTodo> parsedTodos = [];
    if (queryResults.isNotEmpty) {
      for (var element in queryResults) {
        parsedTodos.add(ModelTodo.fromJson(element));
      }
    }
    return parsedTodos;
  }

  /* delete a todo by it's id  */
  Future<int> deleteTodo(int id) async {
    return await database.delete("TODO", where: 'todo_id = ?', whereArgs: [id]);
  }
}
