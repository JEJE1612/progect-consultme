import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/AdminLayout.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/Feather/Login/mangment/LoginState.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomButtonAuth%20.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomTextForm.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/Mangment/CreatAccoubtState.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/Mangment/creatAccountBloc.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Redister extends StatelessWidget {
  static const String nameKey = "Redister";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController namme = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formkey = GlobalKey<FormState>();

  Redister({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CreatAccount(),
      child: BlocConsumer<CreatAccount, CratAccountState>(
        listener: (context, state) {
          if (State is ErrorCrestLodingState) {
            tost(state: ToastStae.eror, text: " Error");
          } else if (State is CreatUserLodingState) {
            const Center(
              child: CircularProgressIndicator(
                color: primarycolor,
              ),
            );
          } else if (State is SaveDataFireStoreScafull) {
            tost(state: ToastStae.succes, text: " Scafull Creat Account");
            Navigator.pushNamedAndRemoveUntil(
                context, HomeLayOut.nameKey, (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          const Logo(),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Sign Up',
                              style: Styles.textStyle36.copyWith(
                                color:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : ScoundColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.072,
                          ),
                          Text(
                            "Name",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            hinttext: "ُEnter Your name",
                            mycontroller: namme,
                            validator: (val) {
                              if (val == "") {
                                print("Cant de empety");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Text(
                            "Email",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            hinttext: "ُEnter Your Email",
                            mycontroller: email,
                            validator: (val) {
                              if (val == "") {
                                print("Cant de empety");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Text(
                            "Phone",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                            hinttext: "ُEnter Your phone",
                            mycontroller: phone,
                            validator: (val) {
                              if (val == "") {
                                print("Cant de empety");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Text(
                            "password",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            hinttext: "ُEnter Your password",
                            mycontroller: password,
                            validator: (val) {
                              if (val == "") {
                                print("Cant de empety");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Container(
                            width: double.infinity,
                            child: CustomButtonAuth(
                              title: "SignUp",
                              onPressed: () async {
                                // if (formkey.currentState!.validate()) {
                                //   CreatAccount.get(context).userRegister(
                                //       email: email.text,
                                //       password: password.text,
                                //       phone: phone.text,
                                //       name: namme.text);
                                // }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
