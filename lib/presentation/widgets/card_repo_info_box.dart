import 'package:flutter/material.dart';


class CardRepoInfoBox extends StatelessWidget {
  final IconData icon;
  final String infoTitle;
  final String infoValue;

  const CardRepoInfoBox({
    super.key, required this.icon, required this.infoTitle, required this.infoValue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: Colors.grey.shade800,),
              Text(infoValue, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ],
          ),
          Text(infoTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade500)),
        ],
      ),
    );
  }
}