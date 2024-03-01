// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

abstract class LoginState {}

class InitalState extends LoginState {}

class ChangeIconSuffix extends LoginState {}

class LodingLoginState extends LoginState {}

class LoginSucssesState extends LoginState {
  final String uid;
  LoginSucssesState({
    required this.uid,
  });
}

class LoginFailureState extends LoginState {}

class Forgetpasswordstate extends LoginState {}

class LoginAsClint extends LoginState {}

class LoginAsConsltent extends LoginState {}
