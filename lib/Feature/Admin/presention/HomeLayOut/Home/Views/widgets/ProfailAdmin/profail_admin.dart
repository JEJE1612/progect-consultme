import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/Mangment/admin_bloc.dart';
import 'package:flutter_application_1/Feature/Admin/Mangment/admin_bloc_state.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/ProfailAdmin/widgets/profail_admin_body.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfailAdmin extends StatelessWidget {
  static const String nameKey = "Profail";

  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final UserModel? model;
  ProfailAdmin({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AdminBloc.get(context).usermodel;
        return ProfailBodyAdmin(size: size, model: model);
      },
    );
  }
}
