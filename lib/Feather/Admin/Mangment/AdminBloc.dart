import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/sharedPresfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBloc extends Cubit<AdminState> {
  AdminBloc() : super(InitnalState());
  static AdminBloc get(context) => BlocProvider.of(context);
  var uid = CacheHealper.getData("uid", key: "uid");
  UserModel? usermodel;
  void getUserData() {
    emit(LodingGetUserData());
    FirebaseFirestore.instance.collection('user').doc(uid).get().then((value) {
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
}
