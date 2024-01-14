import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/Widgets/Home/Widgets/GradViewBuilderAdmin.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/GradViewBuilder.dart';

class GridViewBuilderAdmin extends StatelessWidget {
  const GridViewBuilderAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 15,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: 0.999,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const GradViewBuilderAdmin();
      },
    );
  }
}
