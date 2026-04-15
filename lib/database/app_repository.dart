
import 'package:todo_list_04flu/database/app_database.dart';
import 'package:todo_list_04flu/database/todo.dart';

abstract class AppRepository {
  List<Todo> getList();
}

class AppRepositoryImplementation extends AppRepository {
  final AppDatabase db;

  AppRepositoryImplementation({required this.db});

  @override
  List<Todo> getList() => db.getList();
}