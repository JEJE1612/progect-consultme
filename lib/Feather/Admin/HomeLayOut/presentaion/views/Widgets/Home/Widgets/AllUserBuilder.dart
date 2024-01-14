import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/Widgets/Home/Widgets/BuildUseritems.dart';

class AllUserBuilder extends StatelessWidget {
  const AllUserBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => const buildUserItems(),
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: 10),
    );
  }
}
