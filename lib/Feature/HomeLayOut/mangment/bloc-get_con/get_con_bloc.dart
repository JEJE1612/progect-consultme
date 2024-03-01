import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc-get_con/get_con-bloc_state.dart';
import 'package:flutter_application_1/core/Model/ask_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetConsultnt extends Cubit<GetConsultantState> {
  GetConsultnt() : super(InitalState());
  static GetConsultnt get(context) => BlocProvider.of(context);

  List<AskModel> someWorkco = [];
  List someWorkcoid = [];
  void getSomeWorkcon({required String uid}) async {
    print("hhhhhhhhhhhhhhhh");
    emit(LodingGetListSomeWork());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Work')
          .where("uId", isEqualTo: uid)
          .orderBy(
            "dateTime",
          )
          .get();

      for (var element in querySnapshot.docs) {
        someWorkco
            .add(AskModel.fromJson(element.data() as Map<String, dynamic>));
        someWorkcoid.add(element.id);
      }
      print(someWorkcoid.length);

      emit(ScafullGetSomeWork());
    } catch (e) {
      print("Error in getAsk: $e");
    }
  }
}
