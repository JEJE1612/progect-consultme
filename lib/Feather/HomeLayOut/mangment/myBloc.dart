import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/home/Home.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/ProfailConsultant.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/myState.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/Catroieus.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/chat.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/profail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Setting/views/setting.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/sharedPresfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyBloc extends Cubit<MyState> {
  MyBloc() : super(InitalState());
  static MyBloc get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<Widget> views = [
    const CatroiesScreen(),
    const ChatScreen(),
    Profail(),
    const Setting(),
  ];

  List<Widget> viewsConsultant = [
    const HomeCuslatant(),
    const ChatScreen(),
    const ProfailConsultant(),
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

  var uid = CacheHealper.getData("uid", key: "uid");
  UserModel? usermodel;

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User signed out successfully");
      emit(ScafullsignOut());
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  void getUserData() {
    emit(LodingGetUserData());
    FirebaseFirestore.instance.collection('user').doc(uid).get().then((value) {
      if (value.exists) {
        Map<String, dynamic>? data = value.data();
        if (data != null) {
          usermodel = UserModel.fromJson(data);
          emit(ScafullGetUserData());
          print("$usermodel");
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

  File? imageUser;

  ImagePicker picker = ImagePicker();

  Future<void> getImageProfail() async {
    emit(LodingGetProfailImage());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageUser = File(pickedFile.path);
      print(imageUser);

      emit(ScafullGetProfailImage());
    } else {
      print('No image selected.');
      emit(ErrorGetProfailImage());
    }
  }

  File? coverUser;

  Future<void> getCover() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverUser = File(pickedFile.path);
      emit(ScafullGetCoverImage());
    } else {
      emit(ErrorGetCoverImage());
    }
  }

  void udateUserData({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    emit(LodingudateUserData());
    UserModel model = UserModel(
      name: name,
      email: usermodel!.email,
      phone: phone,
      uid: usermodel!.uid,
      type: "",
      bio: bio,
      image: image ?? usermodel!.image,
      cover: cover ?? usermodel!.cover,
    );

    FirebaseFirestore.instance
        .collection("user")
        .doc(usermodel?.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
      emit(ScafulludateUserData());
    }).catchError((eror) {
      emit(ErrorudateUserData());
      print(eror.toString());
    });
  }

  void uploadprofialImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingudateUserData());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imageUser!.path).pathSegments.last}")
        .putFile(imageUser!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadImageProfailState());
        print(value);
        udateUserData(
          name: name!,
          phone: phone!,
          bio: bio!,
          image: value,
        );
        print(value);
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      print(e.toString());
      emit(ErrorUploadImageProfailState());
    });
  }

  void uploadCoverImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingudateUserData());

    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(coverUser!.path).pathSegments.last}")
        .putFile(coverUser!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadcoverAdminState());
        print(value);
        udateUserData(
          name: name!,
          phone: phone!,
          bio: bio!,
          cover: value,
        );
      }).catchError((e) {
        emit(ErorUploadcoverAdminState());
      });
    }).catchError((e) {
      emit(ErorUploadcoverAdminState());
    });
  }
}
