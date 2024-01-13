import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/BuildConsulat.dart';

class ListViewCatroisBuild extends StatelessWidget {
  const ListViewCatroisBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => const BuildConsulat(),
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: 10),
    );
  }
}
