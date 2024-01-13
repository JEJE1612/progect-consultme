import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookReating extends StatelessWidget {
  const BookReating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "3.2",
          style: Styles.textStyle16.copyWith(color: Colors.grey),
        ),
        SizedBox(
          width: 6.3,
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
      ],
    );
  }
}
