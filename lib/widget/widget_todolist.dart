import 'package:flutter/material.dart';
import 'package:flutter_sqflite/model/model_todo.dart';
import 'package:flutter_sqflite/state/state_app.dart';
import 'package:provider/provider.dart';

class WidgetTodoList extends StatelessWidget {
  const WidgetTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    var stateApp = Provider.of<StateApp>(context);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: Column(
        children: [
          FutureBuilder<List<ModelTodo>>(
            future: stateApp.futureListTodo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (var item in snapshot.data!)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("id : ${item.id}"),
                                      ElevatedButton(
                                          onPressed: () {
                                            if (item.id != null) {
                                              stateApp
                                                  .deleteTodo(item.id as int)
                                                  .then((value) {
                                                stateApp.getTodos();
                                              });
                                            }
                                          },
                                          child: const Icon(Icons.delete))
                                    ],
                                  ),
                                  Text(item.title),
                                  Text(item.content),
                                ],
                              ),
                            )),
                      )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
