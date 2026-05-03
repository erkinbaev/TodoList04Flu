
import 'package:flutter/material.dart';
import 'package:todo_list_04flu/add/add_state.dart';
import 'package:todo_list_04flu/add/add_view_model.dart';
import 'dart:async';

import 'package:todo_list_04flu/database/app_database.dart';
import 'package:todo_list_04flu/database/app_repository.dart';
import 'package:todo_list_04flu/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatefulWidget{
  const AddPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  late final AddViewModel vm;
  TextEditingController _textEditingController = TextEditingController();
  String message = "";
  bool isMessageVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final repo = AppRepositoryImplementation(db: appDatabase);
    vm = AddViewModel(repo: repo);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("AddPage - didChangeDependencies");
  }

  @override
Widget build(BuildContext context) {
  return BlocProvider.value(
    value: vm,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Добавить задачу"),
      ),
      body: BlocBuilder<AddViewModel, AddState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Введите название задачи"),
                  ),
                ),

                if (!state.isInitial && !state.isSucceed)
                  const Text(
                    "Введите название задачи",
                    style: TextStyle(color: Colors.red),
                  ),

                TextButton(
                  onPressed: _saveTodo,
                  child: const Text("Сохранить"),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}

  void _saveTodo() {
    String title = _textEditingController.text;
    vm.addTodo(title);
    Navigator.pop(context);
    // try {
    //   if (title.length < 3) {
    //     throw TextFieldLengthException("min symbols = 3");
    //   } else if (title.length > 50) {
    //     throw TextFieldLengthException("max symbols = 50");
    //   } else {
    //     appDatabase.insertTodo(TodosCompanion.insert(title: _textEditingController.text, date: DateTime.now().toString(), test: ""));
    //     Navigator.pop(context, _textEditingController.text);
    //     setState(() {
    //       isMessageVisible = !isMessageVisible;
    //       message = "";
    //     });
    //   }
    // } catch (e, backtrace) {
    //   // print("$backtrace");
      
    //   if (e.toString() == "min symbols = 3") {
    //     setState(() {
    //     if (!message.isEmpty) {
    //       message = "Должно быть минимум 3 символа";
    //     }else {
    //       isMessageVisible = !isMessageVisible;
    //       message = "Должно быть минимум 3 символа";
    //     }
    //   });
    //   } else {
    //     setState(() {
    //     if (!message.isEmpty) {
    //       message = "Должно быть максимум 50 символов";
    //     } else {
    //       isMessageVisible = !isMessageVisible;
    //       message = "Должно быть максимум 50 символов";
    //     }
    //   });
    //   }
    // }
  }

  @override
  void didUpdateWidget(covariant AddPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("AddPage - didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("AddPage - deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("AddPage - dispose");
    _textEditingController.dispose();
  }
}

class TextFieldLengthException implements Exception {
  final String message;

  TextFieldLengthException(this.message);

  String toString() {
    return message;
  }
}