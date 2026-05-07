import 'package:flutter/material.dart';

class CardInfoBox extends StatelessWidget {
  const CardInfoBox({
    super.key,
    required this.infoTitle,
    required this.infoValue,
  });

  final String infoTitle;
  final String infoValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 8.0,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Text(
                infoTitle,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 12,
                ),
              ),
              Text(
                infoValue,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}