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
import 'package:flutter_application_1/core/Model/AskQustion.dart';
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

  File? imageAsk;

  void removeimagephoto() {
    imageAsk == File('');
    emit(RemoveAskImage());
  }

  Future<void> getImagePhotogallery() async {
    emit(LodingGetimageAsk());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageAsk = File(pickedFile.path);

      emit(ScafullGetimageAsk());
    } else {
      print('No image selected.');
      emit(ErrorGetimageAsk());
    }
  }

  void uploadAskImage({
    required String text,
    required String date,
    required String postImage,
  }) {
    emit(LodingCreatAskUser());

    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imageAsk!.path).pathSegments.last}")
        .putFile(imageAsk!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatAddPhoto(
          dateTime: date,
          text: text,
          postImge: value,
        );
        emit(ScafullUploadAskImageState());
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      emit(ErorUploadAskImageState());
    });
  }

  List<AskModel> poto = [];
  List potoId = [];

  CollectionReference post = FirebaseFirestore.instance.collection('post');

  void creatAddPhoto({
    required String text,
    String? postImge,
    required String dateTime,
  }) async {
    AskModel model = AskModel(
      uId: usermodel?.uid,
      name: usermodel?.name,
      text: text,
      image: usermodel?.image,
      postImage: postImge ?? "",
      dateTime: dateTime,
    );

    emit(LodingCreatAskUser());
    poto.clear();
    potoId.clear();

    try {
      DocumentReference docRef = await post.add(model.toMap());

      model.docId = docRef.id;

      // Optionally, you can update the document in Firestore with the docId
      await docRef.update({'docId': docRef.id});

      getAsk();

      emit(ScafullCreatAskUser());
    } catch (e) {
      emit(ErrorCreatAskUser());
      print("Error in creating addPhoto: ${e.toString()}");
    }
  }

  void getAsk() async {
    emit(LodingGetListAsk());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .where("uId", isEqualTo: uid)
          .orderBy(
            "dateTime",
          )
          .get();

      querySnapshot.docs.forEach((element) {
        poto.add(AskModel.fromJson(element.data() as Map<String, dynamic>));
        potoId.add(element.id);
      });

      emit(ScafullGetListAsk());
    } catch (e) {
      print("Error in getAsk: $e");
    }
  }

  void deleteAsk(String docId) async {
    try {
      emit(LodingDeleteAskUser());

      // Delete the document from Firestore
      await post.doc(docId).delete();

      // Remove the item from the local list based on the docId
      poto.removeWhere((ask) => ask.docId == docId);
      potoId.remove(docId);

      emit(SuccessDeleteAskUser());
    } catch (e) {
      emit(ErrorDeleteAskUser());
      print("Error in deleting ask: $e");
    }
  }
}
