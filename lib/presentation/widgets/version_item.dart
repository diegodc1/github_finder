import 'package:flutter/material.dart';

class VersionItem extends StatelessWidget {
  final String versionTag;
  final String description;
  final String date;

  const VersionItem({
    super.key, required this.versionTag, required this.description, required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 20,
          children: [
            Icon(Icons.history, size: 25, color: Colors.green),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(versionTag, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.green)),
                Text('$description', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600)),
              ],
            ),
          ],
        ),
        Text('$date', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600)),
      ],
    );
  }
}
