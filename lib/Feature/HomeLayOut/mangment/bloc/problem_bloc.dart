import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc/problem_bloc_state.dart';
import 'package:flutter_application_1/core/Model/block-model.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProblemBloc extends Cubit<Prodlemstae> {
  ProblemBloc() : super(InitalState());
  static ProblemBloc get(context) => BlocProvider.of(context);
  UserModel? usermodel;
  var uid = FirebaseAuth.instance.currentUser?.uid;
  var name = FirebaseAuth.instance.currentUser?.displayName ?? "Default Name";

  ImagePicker picker = ImagePicker();
  List<ProblemModel> listproblem = [];
  List listproblemid = [];

  CollectionReference problem =
      FirebaseFirestore.instance.collection('problem');

  void creatproblem({
    required String text,
    required String dateTime,
    required String namco,
    required String imageco,
    required String name,
    required String image,
  }) async {
    ProblemModel model = ProblemModel(
      namco: namco,
      imageco: imageco,
      name: name,
      text: text,
      uId: uid,
      image: image,
      dateTime: dateTime,
    );
    emit(LodingCreatProblem());
    listproblem.clear();
    listproblemid.clear();

    try {
      DocumentReference docRef = await problem.add(model.toMap());

      model.docId = docRef.id;

      await docRef.update({'docId': docRef.id});

      emit(ScafullCreatProblem());
    } catch (e) {
      emit(ErrorCreatProblem());
      print("Error in creating addPhoto: ${e.toString()}");
    }
  }

  List<ProblemModel> allproblem = [];
  List allproblemid = [];
  void getAllProblem() async {
    emit(LodingGetListAllProblem());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('problem')
          .orderBy(
            "dateTime",
          )
          .get();

      for (var element in querySnapshot.docs) {
        allproblem
            .add(ProblemModel.fromJson(element.data() as Map<String, dynamic>));
        allproblemid.add(element.id);
      }
      print(allproblem.length);
      emit(ScafullGetListproblem());
    } catch (e) {
      print("Error in getAsk: $e");
    }
  }
}
