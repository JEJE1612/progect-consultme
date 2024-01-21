abstract class MyState {}

class InitalState extends MyState {}

class ChangeBottonSheet extends MyState {}

class ChangeTheamMode extends MyState {}

class ScafullsignOut extends MyState {}

class LodingGetUserData extends MyState {}

class ScafullGetUserData extends MyState {}

class ErrorGetUserData extends MyState {
  final String Error;
  ErrorGetUserData(this.Error);
}

class HomeErrorStata extends MyState {
  final String Error;
  HomeErrorStata(this.Error);
}
