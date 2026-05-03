import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_04flu/add/add_state.dart';
import 'package:todo_list_04flu/database/app_database.dart';
import 'package:todo_list_04flu/database/app_repository.dart';

class AddViewModel extends Cubit<AddState>{
  final AppRepository repo;

  AddViewModel({required this.repo}) : super(AddState.initial());

  Future<void> addTodo(String title) async {
    if (title.isEmpty) {
      emit(state.copyWith(isInitial: false, isSucceed: false));
    } else {
      emit(state.copyWith(isInitial: false, isSucceed: true));
      TodosCompanion todo = TodosCompanion.insert(title: title, date: DateTime.now().toString(), test: "");
      repo.addTodo(todo);
    }
  }
}