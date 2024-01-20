import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/sharedPresfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminBloc extends Cubit<AdminState> {
  AdminBloc() : super(InitnalState());
  static AdminBloc get(context) => BlocProvider.of(context);
  var uid = CacheHealper.getData("uid", key: "uid");
  UserModel? usermodel;
  void getUserData() {
    emit(LodingGetUserData());
    FirebaseFirestore.instance
        .collection('user')
        .doc("5CHNt4H7q3URVzPH2QpNZT7Wxcg1")
        .get()
        .then((value) {
      if (value.exists) {
        Map<String, dynamic>? data = value.data();
        if (data != null) {
          usermodel = UserModel.fromJson(data);
          emit(ScafullGetUserData());
        } else {
          emit(HomeErrorStata("Data is null"));
        }
      } else {
        emit(HomeErrorStata("Document does not exist"));
      }
    }).catchError((e) {
      emit(ErrorGetUserData(e));
    });
  }

  List<QueryDocumentSnapshot> dataconsult = [];
  List<QueryDocumentSnapshot> dataclient = [];

  getconsultant() async {
    emit(LodingGetAllConsltant());
    FirebaseFirestore.instance
        .collection('user')
        .where('type', isEqualTo: 'consulting')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        dataconsult.add(element);
        print(element.data());
      });
      print(value.toString());
      emit(ScafullGetAllConsltant());
    }).catchError((e) {
      emit(ErrorGetGetAllConsltant());
    });
  }

  getAllUser() async {
    emit(LodingGetAlluser());
    FirebaseFirestore.instance
        .collection('user')
        .where('type', isEqualTo: 'client')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        dataclient.add(element);
        print(element.data());
      });
      print(value.toString());
      emit(ScafullGetAllUser());
    }).catchError((e) {
      emit(ErrorGetGetAllConsltant());
    });
  }

  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageProfail() async {
    emit(LodingGetProfailImage());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      emit(ScafullGetProfailImage());
    } else {
      print('No image selected.');
      emit(ErrorGetProfailImage());
    }
  }

  File? cover;

  Future<void> getCover() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      cover = File(pickedFile.path);
      emit(ScafullGetCoverImage());
    } else {
      emit(ErrorGetCoverImage());
    }
  }

  void udateAdminData({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    emit(LodingUdateAdminData());
    UserModel model = UserModel(
        name: name,
        email: usermodel!.email,
        phone: phone,
        uid: uid,
        type: "",
        bio: bio,
        image: image,
        cover: cover);

    FirebaseFirestore.instance
        .collection("user")
        .doc(usermodel?.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
      emit(ScafullUdateAdminData());
    }).catchError((eror) {
      emit(ErrorUdateAdminData());
      print(eror.toString());
    });
  }

  // void uploadprofialImage({
  //   required String? name,
  //   required String? phone,
  //   required String? bio,
  // }) {
  //   emit(LodingUploadImageProfailState());
  //       FirebaseFirestore.instance
  //       .ref()
  //       .child("user/${Uri.file(image!.path).pathSegments.last}")
  //       .putFile(image!)
  //       .then((value) {
  //     value.ref.getDownloadURL().then((value) {
  //       emit(ScafullUploadImageProfailState());
  //       print(value);
  //       udateAdminData(
  //         name: name!,
  //         phone: phone!,
  //         bio: bio!,
  //         image: value,
  //       );
  //     }).catchError((e) {
  //       emit(ErrorUploadImageProfailState());
  //     });
  //   }).catchError((e) {
  //     emit(ErrorUploadImageProfailState());
  //   });
  // }
}
