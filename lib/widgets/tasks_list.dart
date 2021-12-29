import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// wrap any downstream widgets with Consumer so it has easy access to provider variables
    return Consumer<TaskData>(
      // name the provider variable "taskData"
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxCallback: (newValue) {
                // setState(() {
                //   // add "!" exclamation mark after newValue to check for null safety
                //   Provider.of<TaskData>(context).tasks[index].isDone = newValue!;
                // });
              },
            );
          },
          // itemCount: Provider.of<TaskData>(context).tasks.length,
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
