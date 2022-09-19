/// Created by David
/// Date: 19.09.22

/// Create a Task model.
///
/// [title] Task title {required}
///
/// [subtitle] Task subtitle {required}
///
/// [done] provides status of current Task
///
/// [toggleDone] is changes done state `true` -> `false`, `false` -> `true`

class Task {
  final String title;
  final String subtitle;
  bool done;

  Task({
    required this.title,
    required this.subtitle,
    this.done = false,
  });

  void toggleDone() {
    done = !done;
  }
}
