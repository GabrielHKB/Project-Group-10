import 'package:api_test/widgets/tab_header.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabHeader("Kontakta Oss"),
        const Placeholder(),
      ],
    );
  }
}