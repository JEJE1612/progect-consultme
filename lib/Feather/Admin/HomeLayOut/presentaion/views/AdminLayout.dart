import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/mangment/AdminState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminLyOut extends StatelessWidget {
  static const String nameKey = "HomeLayOut";

  const AdminLyOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc = AdminBloc.get(context);
        return Scaffold(
          body: bloc.views[bloc.currentindex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: bloc.currentindex,
              onTap: (value) {
                bloc.changeBootomSheet(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: "chat",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_add_disabled,
                    ),
                    label: "AllUser"),
              ]),
        );
      },
    );
  }
}
