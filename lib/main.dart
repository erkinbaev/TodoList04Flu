import 'package:flutter/material.dart';
import 'package:todo_list_04flu/database/app_database.dart';
import 'package:todo_list_04flu/home/home_page.dart';

late final AppDatabase appDatabase;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appDatabase = AppDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({super.key});
  bool isOnboardingShown = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page')
    );
  }
}

