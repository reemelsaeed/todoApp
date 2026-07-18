import 'package:flutter/material.dart';
import 'package:todo_app/core/models/models.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task, required this.ontap});
  final TaskModel task;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color.fromARGB(255, 235, 235, 235)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: task.selectedColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    task.subTitle,
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: task.selectedColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      task.status.name,
                      style: TextStyle(
                        color: task.selectedColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: ontap,
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
