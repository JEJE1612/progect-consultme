import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:gap/gap.dart';

class InformationUser extends StatelessWidget {
  const InformationUser({
    super.key,
    required this.model,
  });

  final UserModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              Gap(5),
              Text(
                "${model?.name}",
                style: Styles.textStyle18,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Gap(10),
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                color: Colors.grey,
                size: 16,
              ),
              Gap(5),
              Text(
                "${model?.bio}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Gap(5),
          if (MyBloc.get(context).usermodel?.type != 'client')
            Row(
              children: [
                const Icon(
                  Icons.work,
                  color: Colors.grey,
                  size: 16,
                ),
                Gap(5),
                Text(
                  "Admin",
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          Gap(5),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.grey,
                size: 16,
              ),
              Gap(5),
              Text(
                "${model?.phone}",
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
