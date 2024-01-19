import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/AdminViews.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/CustomDrawer.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: ListView(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        Icons.reorder_outlined,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "CONSULT ME",
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
                SizedBox(
                  height: Size.height * 0.06,
                ),
                const Logo(),
                SizedBox(
                  height: Size.height * 0.02,
                ),
                const AdminViews(
                  Name: "Numder Catroies",
                  numder: "4",
                ),
                SizedBox(
                  height: Size.height * 0.02,
                ),
                const AdminViews(
                  Name: "Numder Consultant",
                  numder: "4",
                ),
                SizedBox(
                  height: Size.height * 0.02,
                ),
                const AdminViews(
                  Name: "Numder User",
                  numder: "4",
                ),
              ],
            ),
          ),
        ));
  }
}