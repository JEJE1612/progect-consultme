import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class AdminViews extends StatelessWidget {
  const AdminViews({
    super.key,
    required this.Name,
    required this.numder,
  });
  final String Name;
  final String numder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(color: Colors.grey),
      child: Column(
        children: [
          Text(
            Name,
            style: Styles.textStyle20.copyWith(color: Colors.white),
          ),
          Text(
            numder,
            style: Styles.textStyle36.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
