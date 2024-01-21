import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/CustomDrawer/CustomDrawerHeader.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/CustomDrawer/CustomListTile.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/CustomDrawer/OwnerInfo.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/problemClient/problem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/DeleteCatroies/AddCatoies.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/DeleteCatroies/DeleteCatroies.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/ProfailAdmin/ProfailAdmin.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/ShowCatroies/ShowCatroies.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/consultantMangment/ShowAllConsultant.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: const Duration(milliseconds: 500),
          width: _isCollapsed ? 300 : 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Color(0xFF141414),
          ),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                CustomDrawerHeader(
                  isCollapsable: _isCollapsed,
                  model: AdminBloc.get(context).usermodel,
                ),
                const Divider(color: Colors.grey),
                //MangmentCatroies
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.note_add_outlined,
                  title: 'Add Catroies',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCatroies(),
                        ));
                  },
                ),

                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.visibility_outlined,
                  title: 'Show Catroes',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowCatroies(),
                        ));
                  },
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.delete_outline,
                  title: 'Delete Catroes',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeleteCatroies(),
                        ));
                  },
                ),

                const Divider(color: Colors.grey),

                //Mangment Consultant
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.supervised_user_circle_sharp,
                  title: 'Show Consultant',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowAllConaltant(),
                        ));
                  },
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.person_2_outlined,
                  title: 'Show User',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowAllConaltant(),
                        ));
                  },
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.contact_support_outlined,
                  title: 'Contact Us',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Prodlem(),
                        ));
                  },
                ),

                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.delete_outline,
                  title: 'Delete ',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeleteCatroies(),
                        ));
                  },
                ),

                const Divider(color: Colors.grey),

                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.person_2_outlined,
                  title: 'Profail',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfailAdmin(
                            model: AdminBloc.get(context).usermodel!,
                          ),
                        ));
                  },
                ),
                OwnerInfo(
                  isCollapsed: _isCollapsed,
                  model: AdminBloc.get(context).usermodel!,
                ),
                Align(
                  alignment: _isCollapsed
                      ? Alignment.bottomRight
                      : Alignment.bottomCenter,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    icon: Icon(
                      _isCollapsed
                          ? Icons.arrow_back_ios
                          : Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCollapsed = !_isCollapsed;
                      });
                    },
                  ),
                ),
              ]
                  .map(
                    (e) => Padding(
                      padding: e is Drawer
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(top: 10),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
