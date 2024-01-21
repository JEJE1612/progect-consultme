import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/CustomDrawer/OwnerAvatar.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isCollapsable;

  CustomDrawerHeader({
    super.key,
    required this.isCollapsable,
    required this.model,
  });
  UserModel? model;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          const OwnerAvatar(),
          if (isCollapsable) ...[
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "${model?.name}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
