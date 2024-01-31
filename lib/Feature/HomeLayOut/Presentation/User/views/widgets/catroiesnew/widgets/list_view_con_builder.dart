import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/build_consultant.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewConsultantincategory extends StatelessWidget {
  ListViewConsultantincategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return BuildConsulatNew(i: index);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: MyBloc.get(context).dataanyconsult.length,
            ),
          );
        });
  }
}
