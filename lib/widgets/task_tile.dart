import 'package:flutter/material.dart';

// StateWidget - state object it’s coupled with, is mutable and allows the rebuild of the widget whenever the state changes.
// StatelessWidget - all of the widget’s properties are immutable.

class TaskTile extends StatelessWidget {
  TaskTile({required this.isChecked, required this.taskTitle});

  final bool isChecked;
  final String taskTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          // hide and show the line strike based on isChecked value
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      // passing parent value to child
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newvalue) {},
      ),
    );
  }
}

//
// (bool? newValue) {
//           setState(() {
//             // add "!" exclamation mark after newValue to check for null safety
//             isChecked = newValue!;
//           });
//         },
