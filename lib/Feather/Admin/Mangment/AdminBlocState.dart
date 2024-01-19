abstract class AdminState {}

class InitnalState extends AdminState {}

class LodingGetUserData extends AdminState {}

class ScafullGetUserData extends AdminState {}

class ErrorGetUserData extends AdminState {
  final String Error;
  ErrorGetUserData(this.Error);
}

class HomeErrorStata extends AdminState {
  final String Error;
  HomeErrorStata(this.Error);
}

class LodingGetAllConsltant extends AdminState {}

class ScafullGetAllConsltant extends AdminState {}

class LodingGetAlluser extends AdminState {}

class ScafullGetAllUser extends AdminState {}

class ErrorGetGetAllConsltant extends AdminState {}
