import 'package:flutter/material.dart';

class ContributorItem extends StatelessWidget {
  final String linkImage;
  final String username;

  const ContributorItem({
    super.key,
    required this.linkImage,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 25, backgroundImage: NetworkImage(linkImage)),
        Text('$username', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey.shade700))
      ],
    );
  }
}
