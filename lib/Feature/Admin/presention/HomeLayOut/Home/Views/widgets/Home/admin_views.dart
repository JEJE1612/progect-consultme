import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:gap/gap.dart';

class AdminViews extends StatelessWidget {
  const AdminViews({
    super.key,
    required this.name,
    required this.numder,
  });
  final String name;
  final String numder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.16,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(50)),
      child: Column(
        children: [
          Gap(20),
          Text(
            name,
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
