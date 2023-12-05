import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite/page/page_home.dart';
import 'package:flutter_sqflite/state/state_app.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }

  databaseFactory = databaseFactoryFfi;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StateApp(),
        child: const MaterialApp(home: PageHome()));
  }
}
