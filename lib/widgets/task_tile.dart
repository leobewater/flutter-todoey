import 'package:flutter/material.dart';

// StateWidget - changeable
// StatelessWidget - non-changeable

// convert StatelessWidget to StatefulWidget
class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

// This is the state object
class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  // using callback to change parent properties value
  // void checkboxCallback(bool? newValue) {
  //   setState(() {
  //     // add "!" exclamation mark after newValue to check for null safety
  //     isChecked = newValue!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Task Item 1',
        style: TextStyle(
          // hide and show the line strike based on isChecked value
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      // passing parent value to child
      trailing: TaskCheckbox(
        isChecked,
        // checkboxCallback,
        (bool? newValue) {
          setState(() {
            // add "!" exclamation mark after newValue to check for null safety
            isChecked = newValue!;
          });
        },
      ),
    );
  }
}

// all properties needed to be final and can't be changed in a StatelessWidget
class TaskCheckbox extends StatelessWidget {
  TaskCheckbox(this.checkboxState, this.changeFunc);

  final bool checkboxState;
  final Function(bool?) changeFunc;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: changeFunc,
    );
  }
}
