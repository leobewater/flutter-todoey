import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task.dart';

// convert this to a stateful widget so we can update the tasks
class TasksList extends StatefulWidget {
  TasksList(this.tasks);
  final List<Task> tasks; // accept tasks

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: widget.tasks[index].isDone,
          taskTitle: widget.tasks[index].name,
          checkboxCallback: (newValue) {
            setState(() {
              // add "!" exclamation mark after newValue to check for null safety
              widget.tasks[index].isDone = newValue!;
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
