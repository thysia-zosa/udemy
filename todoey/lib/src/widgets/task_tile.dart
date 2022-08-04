import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
    required this.onLongpress,
    required this.toggleCheckbox,
  }) : super(key: key);

  final Task task;
  final VoidCallback onLongpress;
  final void Function(bool?) toggleCheckbox;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
          color: Colors.lightBlue,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: toggleCheckbox,
        activeColor: Colors.lightBlueAccent,
      ),
      onLongPress: onLongpress,
    );
  }
}
