import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class CustomAppBarAbmin extends StatelessWidget {
  const CustomAppBarAbmin({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.arrow_back_ios),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "Setting",
          style: Styles.textStyle20,
        ),
      ],
    );
  }
}
