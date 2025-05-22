import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  final String title;

  const TabHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      color: const Color(0xFFCC4D3D),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF551C16),
        ),
      ),
    );
  }
}