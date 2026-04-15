import 'package:flutter/material.dart';

class Todo {
  final int id;
  final String title;
  final String date;
  final bool isDone;
  //final TodoColor color;

  Todo({required this.id, required this.title, required this.date, required this.isDone});
}

class TodoColor {
 // final String hex;
  final int r;
  final int g;
  final int b;

  TodoColor({required this.r, required this.g, required this.b});
}