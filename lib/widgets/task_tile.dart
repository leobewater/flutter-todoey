import 'package:flutter/material.dart';

// StateWidget - state object it’s coupled with, is mutable and allows the rebuild of the widget whenever the state changes.
// StatelessWidget - all of the widget’s properties are immutable.

class TaskTile extends StatelessWidget {
  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
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
        onChanged: checkboxCallback,
      ),
    );
  }
}
