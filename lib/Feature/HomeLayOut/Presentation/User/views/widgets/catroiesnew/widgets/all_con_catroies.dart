import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/list_view_con_builder.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/Model/catroies_model.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllConaltanttogatogry extends StatelessWidget {
  AllConaltanttogatogry({required this.model, required this.name});
  final CatroiesModel? model;
  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyBloc()..getAllcosultantinCatroies(name),
      child: BlocConsumer<MyBloc, MyState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                )),
                            Text(
                              name,
                              style: Styles.textStyle20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        ListViewConsultantincategory(),
                      ]),
                ),
              ),
            );
          }),
    );
  }
}
