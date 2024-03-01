import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/postItems_some_work_con.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc-get_con/get_con-bloc_state.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc-get_con/get_con_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildListConWork extends StatelessWidget {
  const BuildListConWork({
    super.key,
    required this.uid,
  });
  final String uid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetConsultnt()..getSomeWorkcon(uid: uid),
      child: BlocConsumer<GetConsultnt, GetConsultantState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => PostItemsSomeWorkCon(
              model: GetConsultnt.get(context).someWorkco[index],
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 5,
            ),
            itemCount: GetConsultnt.get(context).someWorkco.length,
          );
        },
      ),
    );
  }
}
