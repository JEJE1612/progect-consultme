import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/Consultant/widgets/home_consultant_body.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCosultant extends StatelessWidget {
  static const String nameKey = "HomeCosultant";

  const HomeCosultant({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return HomeConsultantBody();
      },
    );
  }
}
