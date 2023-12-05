import 'package:flutter/material.dart';
import 'package:flutter_sqflite/classes/databasewrapper.dart';
import 'package:flutter_sqflite/state/state_app.dart';
import 'package:flutter_sqflite/widget/widget_todocreate.dart';
import 'package:flutter_sqflite/widget/widget_todolist.dart';
import 'package:provider/provider.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late Future<DatabaseWrapper> futureDatabaseWrapper;

  @override
  void initState() {
    super.initState();
    futureDatabaseWrapper = DatabaseWrapper.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    var stateApp = Provider.of<StateApp>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Flexible(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: FutureBuilder<DatabaseWrapper>(
                future: futureDatabaseWrapper,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    stateApp.init(snapshot.data!.database);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            "Connected to the database located at : ${snapshot.data!.database.path}"),
                        WidgetTodoCreate(),
                        const WidgetTodoList()
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
