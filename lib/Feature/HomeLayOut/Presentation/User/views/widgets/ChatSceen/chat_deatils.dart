import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/ChatSceen/build_message.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/ChatSceen/build_my_message.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

chatDeatiles(UserModel? user) {
  var massageController = TextEditingController();

  return BlocProvider(
    create: (context) => MyBloc()
      ..getmessages(
        resiverId: user!.uid!,
      ),
    child: BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is LodingUploadChatImageState) {
          CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "${user?.image}",
                  ),
                  radius: 20,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "${user?.name}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  MyBloc.get(context).getChatImage(
                    chatImage: '',
                    reseverId: user!.uid!,
                    dateTime: DateTime.now().toString(),
                    text: "",
                  );
                },
                icon: const Icon(Icons.camera_alt),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        if (user?.uid ==
                            MyBloc.get(context).messages[index].senderId) {
                          return Buildmesssage(
                            massge: MyBloc.get(context).messages[index],
                          );
                        }
                        return BuildMyMessage(
                          massge: MyBloc.get(context).messages[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemCount: MyBloc.get(context).messages.length),
                ),
                TextFormField(
                  controller: massageController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          MyBloc.get(context).sendMessagechat(
                            text: massageController.text,
                            dateTime: DateTime.now().toString(),
                            reseverId: user!.uid!,
                          );
                          massageController.clear();
                        },
                        icon: const Icon(
                          Icons.send,
                        ),
                      ),
                      hintText: "message",
                      focusedBorder: customStyleBorderchat(),
                      disabledBorder: customStyleBorderchat(),
                      border: customStyleBorderchat(),
                      enabledBorder: customStyleBorderchat()),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

OutlineInputBorder customStyleBorderchat() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.black));
}



//   final UserModel model;
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
