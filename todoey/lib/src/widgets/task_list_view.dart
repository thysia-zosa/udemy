import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import 'task_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) => TaskTile(
          task: taskData.taskList[index],
          onLongpress: () => taskData.deleteTask(index),
          toggleCheckbox: (_) => taskData.updateTask(index),
        ),
      ),
    );
  }
}
