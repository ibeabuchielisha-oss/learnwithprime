import 'package:flutter/material.dart';

class SubjectProgressTile extends StatelessWidget {
  final String subject;
  final double progress;

  const SubjectProgressTile({
    super.key,
    required this.subject,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$subject ${(progress * 100).toInt()}%",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: progress),
          duration: const Duration(milliseconds: 800),
          builder: (context, value, _) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 8,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation(Color(0xFF6C63FF)),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
