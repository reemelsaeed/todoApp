import 'dart:io';
import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key, required this.ontap, this.imageFile});

  final VoidCallback ontap;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 140,
        height: 140,
        decoration: const BoxDecoration(
          color: Color(0xFFE8EAF6),
          shape: BoxShape.circle,
        ),
        child: imageFile != null
            ? ClipOval(
                child: Image.file(
                  imageFile!,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.person, size: 70, color: Color(0xFF3F51B5)),
      ),
    );
  }
}
