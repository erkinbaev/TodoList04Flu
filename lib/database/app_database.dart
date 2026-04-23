
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:todo_list_04flu/database/todos.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //READ
  Future <List<Todo>> getTodoList() {
    return select(todos).get();
  }

  //CREATE 
  Future <int> insertTodo(TodosCompanion todo) {
    return into(todos).insert(todo);
  }
  
    //UPDATE

    //DELETE
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationCacheDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}