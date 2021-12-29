import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:todoey/models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // wrap everything with a Provider(like vuex)
    return MultiProvider(
      providers: [
        // make TaskData() class available in the Provider
        ChangeNotifierProvider(create: (_) => TaskData()),
        // ChangeNotifierProvider(create: (_) => TaskData()),
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
