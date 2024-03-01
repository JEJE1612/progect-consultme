import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/core/utils/constant.dart';

class HomeConsultantBody extends StatelessWidget {
  const HomeConsultantBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyBloc.get(context)
            .viewsConsultant[MyBloc.get(context).currentindex],
        bottomNavigationBar: NavigationButton());
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: primarycolor,
      unselectedItemColor: Colors.grey,
      currentIndex: MyBloc.get(context).currentindex,
      onTap: (value) async {
        if (value == 1) { 
          await MyBloc.get(context).getAllUser();
          MyBloc.get(context).changeBootomSheet(value);
        } else if (value == 2) {
          await MyBloc.get(context).getUserData();
          MyBloc.get(context).changeBootomSheet(value);
        } else {
          MyBloc.get(context).changeBootomSheet(value);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "Chat",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
            ),
            label: "Profile"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "Settings"),
      ],
    );
  }
}
