import 'package:flutter/material.dart';
import 'package:schedule_me/Widgets/ContainerBox.dart';

class ScheduleFileCard extends StatelessWidget {
  final String fileName;
  final VoidCallback onTap;

  const ScheduleFileCard({
    Key? key,
    required this.fileName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBox(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Row(
          children: [
            // Icon for file type
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.insert_drive_file,
                color: const Color.fromARGB(255, 0, 124, 87),
                size: 32,
              ),
            ),

            const SizedBox(width: 16),

            // File name text
            Expanded(
              child: Text(
                fileName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                ),
              ),
            ),

            // Chevron icon for navigation
            Icon(Icons.chevron_right, color: Colors.grey[600], size: 28),
          ],
        ),
      ),
    );
  }
}
