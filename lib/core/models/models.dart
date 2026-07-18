import 'package:flutter/material.dart';

class TaskModel {
  String title;
  String subTitle;
  Taskstatus status;
  Color selectedColor;
  TaskModel({
    required this.title,
    this.subTitle = '',
    required this.status,
    required this.selectedColor,
  });
}

enum Taskstatus { Done, Pending, InProgress }
