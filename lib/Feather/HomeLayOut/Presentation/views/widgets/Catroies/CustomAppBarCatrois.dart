import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class CustomAppBarCatrois extends StatelessWidget {
  const CustomAppBarCatrois({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Consult Me",
          style: Styles.textStyle20,
        ),
      ],
    );
  }
}
