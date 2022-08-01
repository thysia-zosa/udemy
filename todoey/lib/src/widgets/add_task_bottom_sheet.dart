import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String taskTitle = '';
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('Add Task: Title'),
          TextField(
            autofocus: true,
            onChanged: (value) => taskTitle = value,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context).addTask(
                Task(title: taskTitle),
              );
              Navigator.pop(context);
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
