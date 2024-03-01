import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Auth/Login/mangment/LoginBloc.dart';
import 'package:flutter_application_1/Feature/Auth/Login/mangment/LoginState.dart';
import 'package:flutter_application_1/Feature/Auth/Login/presentaion/Widgets/login_body.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/Consultant/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/HomeLayOut.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/shared_presfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String nameKey = "LoginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSucssesState) {
            CacheHealper.savedData(key: "uid", value: state.uid);
            tost(text: "Login ", state: ToastState.succes);
            BlocProvider.of<LoginBloc>(context).getUserType(uid: state.uid);
          } else if (state is LoginFailureState) {
            tost(text: "Error Please try Again", state: ToastState.eror);
          } else if (state is LoginAsClint) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeLayOut.nameKey, (route) => false);
            CacheHealper.savedData(key: "AccountType", value: "client");
          } else if (state is LoginAsConsltent) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeCosultant(),
                ),
                (route) => false);
            CacheHealper.savedData(key: "AccountType", value: "consulting");
          }
        },
        builder: (context, state) {
          return LoginBody();
        },
      ),
    );
  }
}
