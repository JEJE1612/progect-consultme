import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class GradViewBuilderAdmin extends StatelessWidget {
  const GradViewBuilderAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              color: Colors.black87,
              Icons.delete,
            ),
          ),
        ),
      ],
    );
  }
}
