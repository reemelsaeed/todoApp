import 'package:flutter/material.dart';
import 'package:todo_app/core/dummyData/dummyData.dart';
import 'package:todo_app/core/models/models.dart';
import 'package:todo_app/features/tasks/widgets/textFiled_widget.dart';

class AddtaskScreen extends StatefulWidget {
  const AddtaskScreen({super.key});

  @override
  State<AddtaskScreen> createState() => _AddtaskScreenState();
}

class _AddtaskScreenState extends State<AddtaskScreen> {
  Color? selectedColor;
  Taskstatus selectedStatus = Taskstatus.Pending;

  final List<Color> taskColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  // Taskstatus? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Add New Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                controller: titleController,
                label: 'Title',
                hint: 'eg. Task 1',
              ),
              const SizedBox(height: 22),
              AppTextField(
                controller: descController,
                label: 'Description',
                hint: 'eg. Task Description',
                maxLines: 5,
              ),
              const SizedBox(height: 22),
              const Text(
                'Status',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<Taskstatus>(
                value: selectedStatus,
                items: Taskstatus.values.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(
                      status.name[0].toUpperCase() + status.name.substring(1),
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedStatus = value!);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[50],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.indigo,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Choose Color',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: taskColors.map((color) {
                  final bool isSelected = color == selectedColor;
                  return Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: isSelected ? 42 : 36,
                        height: isSelected ? 42 : 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                          // border: isSelected
                          //     ? Border.all(color:, width: 3)
                          //     : null,
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    allTasks.add(
                      TaskModel(
                        title: titleController.text,
                        subTitle: descController.text,
                        status: selectedStatus,
                        selectedColor: selectedColor ?? Colors.white,
                      ),
                    );
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Save Task',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
