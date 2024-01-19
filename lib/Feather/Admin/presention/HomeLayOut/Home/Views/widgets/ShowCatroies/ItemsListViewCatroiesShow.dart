import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class ItemsListViewCatroiesShow extends StatelessWidget {
  const ItemsListViewCatroiesShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            AssetsData.logo,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            "Teather ",
            style: Styles.textStyle18.copyWith(color: Colors.white),
          )),
    );
  }
}
