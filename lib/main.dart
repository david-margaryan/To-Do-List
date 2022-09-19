import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/presentation/ui/screens/tasks_screen.dart';
import 'core/models/task_provider.dart';
import 'core/storage/shared_preferences_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setSharedPreferencesInstance();

  return runApp(
    const MyToDoListApp(),
  );
}

class MyToDoListApp extends StatelessWidget {
  const MyToDoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider(),
        ),
      ],
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
