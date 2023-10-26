import 'package:flutter/material.dart';

class RecipeInstructions extends StatelessWidget {
  final String instructions;

  const RecipeInstructions({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    if (instructions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Text(instructions);
  }
}
