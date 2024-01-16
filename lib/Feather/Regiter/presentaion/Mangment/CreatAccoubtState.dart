abstract class CratAccountState {}

class InitalState extends CratAccountState {}

class CreatUserLodingState extends CratAccountState {}

class ScafullCreatUserState extends CratAccountState {}

class ErrorCrestLodingState extends CratAccountState {
  final Error;
  ErrorCrestLodingState(this.Error);
}

class SaveDataFireStoreLoding extends CratAccountState {}

class SaveDataFireStoreScafull extends CratAccountState {
//final String? uid = model!.uid;
}

class SaveDataFireStoreerror extends CratAccountState {
  final error;
  SaveDataFireStoreerror({this.error});
}
