import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
              longPressCallback: () {
                // added alert box before deletion
                Alert(
                    context: context,
                    title: "DELETE TASK?",
                    style: AlertStyle(
                      titleStyle: TextStyle(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    desc: "\"${task.name}\"",
                    content: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        DialogButton(
                          color: Colors.redAccent,
                          onPressed: () {
                            // delete task
                            taskData.deleteTask(task);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "DELETE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    buttons: [
                      DialogButton(
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "cancel",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ]).show();

                // From course: press and delete task
                // taskData.deleteTask(task);
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
