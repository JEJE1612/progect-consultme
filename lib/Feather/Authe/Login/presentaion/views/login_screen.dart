import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/Authe/Login/mangment/LoginBloc.dart';
import 'package:flutter_application_1/Feather/Authe/Login/mangment/LoginState.dart';
import 'package:flutter_application_1/Feather/Authe/Login/presentaion/Widgets/login_body.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/shared_presfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String nameKey = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LodingLoginState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ScafullLoginState) {
            CacheHealper.savedData(key: "uid", value: state.uid);
            tost(text: "Scaffull Login ", state: ToastState.succes);

            FirebaseFirestore.instance
                .collection("user")
                .doc(state.uid)
                .get()
                .then((userData) {
              var userRole = userData['type'];

              if (userRole == 'consulting') {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeCosultant(),
                    ),
                    (route) => false);
                CacheHealper.savedData(key: "AccountType", value: "consulting");
              } else {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeLayOut.nameKey, (route) => false);
                CacheHealper.savedData(key: "AccountType", value: "client");
              }
            });
          } else if (state is ErrorLoginState) {
            tost(text: "Error Pleas try Again", state: ToastState.eror);
          }
        },
        builder: (context, state) {
          return LoginBody(formkey: formkey, email: email, password: password);
        },
      ),
    );
  }
}
