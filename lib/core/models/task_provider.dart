import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:to_do/core/models/task.dart';

/// Created by David
/// Date: 19.09.22

/// Create a Task Provider model for State Management.
///
/// [_tasks] List<Task> for all Tasks
///
/// [tasks] getter for [_tasks]
///
/// [taskCount] return [_tasks] length
///
/// [addTask] add new Task to [_tasks] List<Task>
///
/// [toggleDone] update [_tasks] List<Task>
///
/// [toggleDone] is changes done state `true` -> `false`, `false` -> `true`
///
/// [deleteTask] is delete the Task from [_tasks] List<Task>

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask({required String title, required String subtitle}) {
    final Task task = Task(title: title, subtitle: subtitle);
    _tasks.add(task);
    notifyListeners();
  }

  void toggleDone(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}