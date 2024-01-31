import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/core/utils/constant.dart';

class HomeConsultantBody extends StatelessWidget {
  const HomeConsultantBody({
    super.key,
    required this.bloc,
  });

  final MyBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bloc.viewsConsultant[bloc.currentindex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primarycolor,
          unselectedItemColor: Colors.grey,
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
                  Icons.person_2_outlined,
                ),
                label: "profail"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "settings"),
          ]),
    );
  }
}
