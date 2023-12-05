import 'package:flutter/material.dart';
import 'package:flutter_sqflite/classes/databasewrapper.dart';
import 'package:flutter_sqflite/dao/dao_todo.dart';
import 'package:flutter_sqflite/model/model_todo.dart';
import 'package:sqflite/sqflite.dart';

class StateApp extends ChangeNotifier {
  late Future<List<ModelTodo>> futureListTodo;
  DaoTodo? daoTodo;
  late Future<DatabaseWrapper> futureDatabaseWrapper;

  void init(Database database) async {
    daoTodo = DaoTodo(database: database);
    futureListTodo = daoTodo!.getTodos();
  }

  void getTodos() {
    if (daoTodo == null) {
      throw Exception("You must call StateApp init");
    }
    futureListTodo = daoTodo!.getTodos();
    notifyListeners();
  }

  Future<int> addTodo(ModelTodo modelTodo) async {
    if (daoTodo == null) {
      throw Exception("You must call StateApp init");
    }
    int insertedId = await daoTodo!.createTodo(modelTodo);
    notifyListeners();
    return insertedId;
  }

  Future<int> deleteTodo(int id) async {
    if (daoTodo == null) {
      throw Exception("You must call StateApp init");
    }
    int deletedId = await daoTodo!.deleteTodo(id);
    notifyListeners();
    return deletedId;
  }
}
