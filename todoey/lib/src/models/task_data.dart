import 'dart:collection';

import 'package:flutter/material.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _taskList = [];

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  int get taskCount => _taskList.length;

  void addTask(Task newTask) {
    _taskList.add(newTask);
    notifyListeners();
  }

  void updateTask(index) {
    _taskList[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }
}
