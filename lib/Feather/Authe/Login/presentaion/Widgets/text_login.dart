import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class TextLogin extends StatelessWidget {
  const TextLogin({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.textStyle36.copyWith(
        color: Theme.of(context).colorScheme.brightness == Brightness.dark
            ? Colors.white
            : scoundColor,
      ),
    );
  }
}
