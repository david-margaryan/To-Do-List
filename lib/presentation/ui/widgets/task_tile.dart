import 'package:flutter/material.dart';

/// Created by David
/// Date: 19.09.22

/// Create a Task Tile for Tasks list screen
///
/// [isChecked] Task is done or not
///
/// [title] Task title
///
/// [subtitle] Task subtitle
///
/// [checkboxCallback] Task [toggle] function
///
/// [longPressCallback] Task delete function
///

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final String subtitle;
  final void Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  const TaskTile({
    Key? key,
    required this.isChecked,
    required this.title,
    required this.subtitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 18.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        checkColor: Colors.white,
        activeColor: Colors.black,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}