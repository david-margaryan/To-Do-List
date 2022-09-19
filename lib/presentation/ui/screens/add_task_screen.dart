import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/models/task_provider.dart';

/// Created by David
/// Date: 19.09.22

/// Create a Add Task Screen for create and add new Task in To Do List (use in showModalBottomSheet)

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    String newSubTitle = '';

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Title'),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Subtitle'),
              onChanged: (newText) {
                newSubTitle = newText;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                if (newSubTitle.isNotEmpty && newTaskTitle.isNotEmpty) {
                  Provider.of<TaskProvider>(context, listen: false)
                      .addTask(title: newTaskTitle, subtitle: newSubTitle);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Title and subtitle are required!'),
                      elevation: 6.0,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
