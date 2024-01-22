import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/consultantMangment/BuildConsultant.dart';

class ListViewCatroisBuild extends StatelessWidget {
  const ListViewCatroisBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => BuildConsulatAdmin(
          i: index,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: AdminBloc.get(context).dataconsult.length,
      ),
    );
  }
}
