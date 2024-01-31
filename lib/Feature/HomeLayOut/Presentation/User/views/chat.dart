import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/ChatSceen/chat_items.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ChatScreen extends StatelessWidget {
  static const String nameKey = "ChatScreen";

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chat",
                        style: Styles.textStyle20,
                      ),
                    ],
                  ),
                  Gap(10),
                  // TextField(
                  //   onChanged: (value) {},
                  //   decoration: InputDecoration(
                  //     hintText: 'Search...',
                  //   ),
                  // ),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => ChatItems(
                        model: MyBloc.get(context).user[index],
                      ),
                      separatorBuilder: (context, index) => const Divider(
                          height: 20, thickness: 0.5, color: Colors.grey),
                      itemCount: MyBloc.get(context).user.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
