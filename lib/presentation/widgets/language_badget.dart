import 'package:flutter/material.dart';

class LanguageBadget extends StatelessWidget {
  final String language;
  final int percentage;
  final Color color;

  const LanguageBadget({
    super.key, required this.language, required this.percentage, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(strokeAlign: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 7,
          children: [
            Icon(Icons.circle, size: 10, color: color),
            Text(language, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade700)),
            Text('($percentage%)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade700))
          ],
        ),
      ),
    );
  }
}