
import 'package:todo_list_04flu/database/app_database.dart';
import 'package:todo_list_04flu/database/todos.dart';

abstract class AppRepository {
  Future <List<Todo>> getList();

  Future<int> addTodo(TodosCompanion todo);
}

class AppRepositoryImplementation extends AppRepository {
  final AppDatabase db;

  AppRepositoryImplementation({required this.db});

  @override
  Future <List<Todo>> getList() => db.getTodoList();

  @override
  Future<int> addTodo(TodosCompanion todo) => db.insertTodo(todo);
  
}