import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/build_con_items.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';

class ListViewConsultantBuild extends StatelessWidget {
  const ListViewConsultantBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Buildconsultantgeneral(i: index);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: MyBloc.get(context).listshowAllConsltant.length),
    );
  }
}
