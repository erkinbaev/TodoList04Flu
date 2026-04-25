
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:todo_list_04flu/database/app_database.dart';
import 'package:todo_list_04flu/main.dart';

class AddPage extends StatefulWidget{
  const AddPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  TextEditingController _textEditingController = TextEditingController();
  String message = "";
  bool isMessageVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("AddPage - didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("AddPage - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Добавить задачу"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(), 
                label: Text("Введите название задачи")
                )
              ),
            Visibility(child: Text(message, style: TextStyle(color: Colors.red)), visible: isMessageVisible),
            TextButton(onPressed: () => _saveTodo(), child: Text("Сохранить"))
          ],
        ),
      )
    );
  }

  void _saveTodo() {
    
    String title = _textEditingController.text;

    try {
      if (title.length < 3) {
        throw TextFieldLengthException("min symbols = 3");
      } else if (title.length > 50) {
        throw TextFieldLengthException("max symbols = 50");
      } else {
        appDatabase.insertTodo(TodosCompanion.insert(title: _textEditingController.text, date: DateTime.now().toString(), test: ""));
        Navigator.pop(context, _textEditingController.text);
        setState(() {
          isMessageVisible = !isMessageVisible;
          message = "";
        });
      }
    } catch (e, backtrace) {
      // print("$backtrace");
      
      if (e.toString() == "min symbols = 3") {
        setState(() {
        if (!message.isEmpty) {
          message = "Должно быть минимум 3 символа";
        }else {
          isMessageVisible = !isMessageVisible;
          message = "Должно быть минимум 3 символа";
        }
      });
      } else {
        setState(() {
        if (!message.isEmpty) {
          message = "Должно быть максимум 50 символов";
        } else {
          isMessageVisible = !isMessageVisible;
          message = "Должно быть максимум 50 символов";
        }
      });
      }
    }
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