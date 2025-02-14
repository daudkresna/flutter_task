import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String text;
  final IconData icon;
  const InfoText({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 40),
        Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
      ],
    );
  }
}
