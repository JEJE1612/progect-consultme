import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/list_con_build.dart';

class ShowAllcon extends StatelessWidget {
  const ShowAllcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomAppBarAbmin(
              onPressed: () {
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              title: "AllConsultant",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const ListViewConsultantBuild(),
          ]),
        ),
      ),
    );
  }
}
