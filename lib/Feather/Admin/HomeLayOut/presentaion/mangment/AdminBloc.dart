import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/mangment/AdminState.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/Widgets/Home/home.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/chat.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/profail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBloc extends Cubit<AdminState> {
  AdminBloc() : super(InitalState());
  static AdminBloc get(context) => BlocProvider.of(context);
  int currentindex = 0;

  List<Widget> views = [
    const Home(),
    const ChatScreen(),
    const Profail(),
    const Setting(),
  ];

  void changeBootomSheet(int index) {
    currentindex = index;
    emit(ChangeBottonSheet());
  }

  ThemeMode themeMode = ThemeMode.light;
  void changeTheam(ThemeMode mode) {
    themeMode = mode;
    emit(ChangeTheamMode());
  }
}
