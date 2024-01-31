import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/Mangment/admin_bloc.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/Home/admin_views.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/custom_drawer.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:gap/gap.dart';

class HomeAdminBody extends StatelessWidget {
  const HomeAdminBody({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
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
                    Center(
                      child: Text(
                        "CONSULT ME",
                        style: Styles.textStyle20,
                      ),
                    ),
                  ],
                ),
                Gap(30),
                const Logo(),
                Gap(50),
                AdminViews(
                  name: "Numder Catroies",
                  numder: "${AdminBloc.get(context).catroiesnum.length}",
                ),
                Gap(20),
                AdminViews(
                  name: "Numder Consultant",
                  numder: "${AdminBloc.get(context).dataconsult.length}",
                ),
                Gap(20),
                AdminViews(
                  name: "Numder User",
                  numder: "${AdminBloc.get(context).dataclient.length}",
                ),
              ],
            ),
          ),
        ));
  }
}
