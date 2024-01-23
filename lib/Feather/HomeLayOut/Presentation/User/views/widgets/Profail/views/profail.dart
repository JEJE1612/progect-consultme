import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/AskQustion.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/BackGroundProfailUser.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/InformationUser.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/ListPostItemsAsk.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/myBloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/myState.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class Profail extends StatelessWidget {
  static const String nameKey = "Profail";

  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  UserModel? model;
  Profail({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is SuccessDeleteAskUser) {
          tost(
            text: "Scafull Dealt",
            state: ToastStae.succes,
          );
        }
      },
      builder: (context, state) {
        var model = MyBloc.get(context).usermodel;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackGroundProfailUser(size: size, model: model),
                  const SizedBox(
                    height: 50,
                  ),
                  InformationUser(model: model),
                  const customLine(),
                  const SizedBox(
                    height: 10,
                  ),
                  ListPostItemsAsk(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
