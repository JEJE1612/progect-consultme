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

class LodingGetProfailImage extends MyState {}

class ScafullGetProfailImage extends MyState {}

class ErrorGetProfailImage extends MyState {}

class ScafullGetCoverImage extends MyState {}

class ErrorGetCoverImage extends MyState {}

class LodingudateUserData extends MyState {}

class ScafulludateUserData extends MyState {}

class ErrorudateUserData extends MyState {}

class ScafullUploadcoverAdminState extends MyState {}

class ScafullUploadImageProfailState extends MyState {}

class ErrorUploadImageProfailState extends MyState {}

class ErorUploadcoverAdminState extends MyState {}
