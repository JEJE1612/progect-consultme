import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/Mangment/admin_bloc.dart';
import 'package:flutter_application_1/Feature/Admin/Mangment/admin_bloc_state.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/Home/home_admin_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        return HomeAdminBody(scaffoldKey: _scaffoldKey);
      },
    );
  }
}
