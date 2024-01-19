import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/DeleteCatroies/ListViewCatriosDelet.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';

class DeleteCatroies extends StatelessWidget {
  const DeleteCatroies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomAppBarAbmin(onPressed: () {}, title: "DeleteCatroies"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const ListViewCatriosDelet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
