import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/presentation/ui/widgets/task_tile.dart';
import '../../../core/models/task_provider.dart';

/// Created by David
/// Date: 19.09.22
///
/// Create a Task List for Tasks

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.taskCount,
          itemBuilder: (context, index) {
            final task = provider.tasks[index];
            return TaskTile(
              title: task.title,
              isChecked: task.done,
              checkboxCallback: (checkboxState) {
                provider.toggleDone(task);
              },
              longPressCallback: () {
                provider.deleteTask(task);
              },
              subtitle: task.subtitle,
            );
          },
        );
      },
    );
  }
}
