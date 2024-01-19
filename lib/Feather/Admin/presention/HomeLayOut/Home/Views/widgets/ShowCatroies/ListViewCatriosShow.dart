import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/ShowCatroies/ItemsListViewCatroiesShow.dart';

class ListViewCatriosShow extends StatelessWidget {
  const ListViewCatriosShow({super.key});

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
        return const ItemsListViewCatroiesShow();
      },
    );
  }
}
