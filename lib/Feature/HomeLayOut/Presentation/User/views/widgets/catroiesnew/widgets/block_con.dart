import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Setting/views/Widgets/CustomButton.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc/problem_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc/problem_bloc_state.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Blockconsultant extends StatefulWidget {
  const Blockconsultant({
    super.key,
    required this.name,
    required this.imageco,
  });
  final String name;
  final String imageco;

  @override
  State<Blockconsultant> createState() =>
      _BlockconsultantState(name: name, imageco);
}

class _BlockconsultantState extends State<Blockconsultant> {
  final String name;
  final String imageco;

  var textControll = TextEditingController();
  DateTime time = DateTime.now();
  UserModel? mode;

  _BlockconsultantState(
    this.imageco, {
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProblemBloc(),
      child: BlocConsumer<ProblemBloc, Prodlemstae>(
        listener: (context, state) {
          if (state is ScafullCreatProblem) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomAppBarAbmin(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                title: "send problem"),
                          ],
                        ),
                        const CustomLine(),
                        const SizedBox(
                          height: 2,
                        ),
                        if (state is LodingCreatProblem)
                          const LinearProgressIndicator(),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextField(
                          onChanged: (value) {
                            textControll.text = value;
                          },
                          controller: textControll,
                          maxLines: 6,
                          decoration: InputDecoration(
                              hintText: "Cause of the problem",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const CustomLine(),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Center(
                          child: CustomButton(
                              onTap: () {
                                ProblemBloc.get(context).creatproblem(
                                  image: MyBloc.get(context).usermodel!.image ??
                                      "",
                                  name:
                                      MyBloc.get(context).usermodel!.name ?? "",
                                  imageco: imageco,
                                  namco: widget.name,
                                  dateTime: time.toString(),
                                  text: textControll.text,
                                );
                              },
                              text: "send"),
                        ),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
