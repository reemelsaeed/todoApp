import 'package:flutter/material.dart';
import 'package:todo_app/core/dummyData/dummyData.dart';
import 'package:todo_app/features/home/widgets/header_widget.dart';
import 'package:todo_app/features/tasks/screens/addTask_screen.dart';
import 'package:todo_app/features/tasks/screens/task_detailes_screen.dart';
import 'package:todo_app/features/tasks/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Good Morning, Reem', style: TextStyle(fontSize: 15)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Quick Overview",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            HomeHeader(
              taskCount: allTasks.length,
              doneCount: 1,
              pendingCount: 0,
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 20),
            const Text(
              "Today's Tasks",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: allTasks.length,
                itemBuilder: (context, index) => TaskWidget(
                  task: allTasks[index],
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TaskDetailesScreen(task: allTasks[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddtaskScreen()),
          );

          if (result == true) {
            setState(() {});
          }
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
