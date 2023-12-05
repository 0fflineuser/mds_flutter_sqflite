import 'package:flutter/material.dart';
import 'package:flutter_sqflite/model/model_todo.dart';
import 'package:flutter_sqflite/state/state_app.dart';
import 'package:provider/provider.dart';

class WidgetTodoCreate extends StatefulWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  WidgetTodoCreate({super.key});

  @override
  State<WidgetTodoCreate> createState() => _WidgetTodoCreateState();
}

class _WidgetTodoCreateState extends State<WidgetTodoCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var stateApp = Provider.of<StateApp>(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              TextFormField(
                controller: widget.titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: widget.contentController,
                decoration: const InputDecoration(
                  hintText: 'Content',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  stateApp
                      .addTodo(ModelTodo(
                          id: null,
                          title: widget.titleController.text,
                          content: widget.contentController.text))
                      .then((value) {
                    stateApp.getTodos();
                  });
                }
              },
              child: const Text('Add TODO'),
            ),
          ),
        ],
      ),
    );
  }
}
