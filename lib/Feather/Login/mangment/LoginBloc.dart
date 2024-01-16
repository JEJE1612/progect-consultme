import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Login/mangment/LoginState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(InitalState());
  static LoginBloc get(context) => BlocProvider.of(context);

  bool obscureText = false;
  IconData icon = Icons.visibility_outlined;

  void changepassWord() {
    obscureText = !obscureText;
    icon =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeIconSuffix());
  }

  void loginUser({
    required String email,
    required String password,
  }) {
    emit(LodingLoginState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(ScafullLoginState());
    }).catchError((e) {
      emit(ErrorLoginState());
    });
  }
}
