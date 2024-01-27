import 'package:flutter/material.dart';

class CreateRatingButton extends StatelessWidget {
  const CreateRatingButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.grey,
      child: const Text(
        "Create",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}