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
            final task = taskData.tasks[index];

            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (newValue) {
                taskData.updateTask(task);
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
