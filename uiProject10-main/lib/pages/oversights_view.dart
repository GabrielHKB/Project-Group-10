import 'package:api_test/widgets/tab_header.dart';
import 'package:flutter/material.dart';

class OversightsView extends StatelessWidget {
  const OversightsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabHeader("Översikt"),
        const Placeholder(),
      ],
    );
  }
}