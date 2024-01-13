import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';

class ListOneCiral extends StatelessWidget {
  const ListOneCiral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 5,
        ),
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.16,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AssetsData.logo,
              ),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
