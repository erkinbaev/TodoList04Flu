
import 'package:todo_list_04flu/database/app_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_04flu/home/home_state.dart';

class HomeViewModel extends Cubit<HomeState>{
  final AppRepository repo;

  HomeViewModel({required this.repo}) : super(HomeState.initial());

  Future<void> getList() async {
    try {
      //ждем список
      final items = await repo.getList();
      //проверяем пустой ли список
      if (items.isEmpty) {
        //если пусто, нужно нарисовать пустой экран с кнопкой добавить
        emit(state.copyWith(isEmpty: true));
      } else {
        //если список не пустой, то нарисовать список с задачами
        emit(state.copyWith(items: items, isEmpty: false));
      }
    } catch (e) {
      print(e);
    }
  }
} 