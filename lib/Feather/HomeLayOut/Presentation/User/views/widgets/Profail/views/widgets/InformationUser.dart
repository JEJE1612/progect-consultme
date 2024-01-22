import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class InformationUser extends StatelessWidget {
  const InformationUser({
    super.key,
    required this.model,
  });

  final UserModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${model?.name}",
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150,
            child: Text(
              "${model?.bio}",
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                "${model?.phone}",
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
