import 'package:flutter/material.dart';

class CommitItem extends StatelessWidget {
  final String commitMessage;
  final String username;
  final String date;

  const CommitItem({
    super.key, required this.commitMessage, required this.username, required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        Icon(Icons.history, size: 25, color: Colors.grey.shade600,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(commitMessage, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade800)),
            Text('$username • $date', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600)),
          ],
        )
      ],
    );
  }
}
