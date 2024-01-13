import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomButtonAuth%20.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomTextForm.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/views/Register.dart';

import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class Login extends StatefulWidget {
  static const String nameKey = "Login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
var formkey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Logo(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Center(
                      child: Text(
                        'Login',
                        style: Styles.textStyle36.copyWith(
                          color: Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? Colors.white
                              : ScoundColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.062,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    CustomTextForm(
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
                      height: MediaQuery.of(context).size.height * 0.052,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    CustomTextForm(
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
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.brightness ==
                                    Brightness.dark
                                ? Colors.white
                                : ScoundColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Container(
                      width: double.infinity,
                      child: CustomButtonAuth(
                        title: "login",
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {}
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Redister.nameKey);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have An Account ? ",
                            style: Styles.textStyle16.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          Text(
                            "Register",
                            style: Styles.textStyle14
                                .copyWith(color: primarycolor),
                          ),
                        ],
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
  }
}
