import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.blue[300],
        radius: 58,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "C",
                style: Styles.textStyle36.copyWith(color: Colors.white),
              ),
              Text(
                "CONSULT ME",
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
