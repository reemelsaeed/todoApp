import 'package:flutter/material.dart';
import 'package:todo_app/core/models/models.dart';

class TaskDetailesScreen extends StatelessWidget {
  const TaskDetailesScreen({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text(task.title)),
    );
  }
}
