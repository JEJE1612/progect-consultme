import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomButtonAuth%20.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomTextForm.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class Redister extends StatefulWidget {
  static const String nameKey = "Redister";

  const Redister({super.key});

  @override
  State<Redister> createState() => _RedisterState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController namme = TextEditingController();
TextEditingController phone = TextEditingController();
var formkey = GlobalKey<FormState>();

class _RedisterState extends State<Redister> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                          color: Theme.of(context).colorScheme.brightness ==
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
                      keyboardType: TextInputType.phone,
                      hinttext: "ُEnter Your phone",
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
                      "password",
                      style: Styles.textStyle18.copyWith(
                        color: Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? Colors.white
                            : ScoundColor,
                      ),
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
                    SizedBox(
                      height: size.height * 0.022,
                    ),
                    Container(
                      width: double.infinity,
                      child: CustomButtonAuth(
                        title: "SignUp",
                        onPressed: () async {
                          Navigator.pushNamed(context, HomeLayOut.nameKey);
                          // if (formkey.currentState!.validate()) {
                          //   // try {
                          //   //   await FirebaseAuth.instance
                          //   //       .signInWithEmailAndPassword(
                          //   //           email: email.text,
                          //   //           password: password.text);
                          //   //   AwesomeDialog(
                          //   //     context: context,
                          //   //     dialogType: DialogType.success,
                          //   //     animType: AnimType.rightSlide,
                          //   //     title: 'welcom',
                          //   //     desc: 'Hello world.',
                          //   //     btnCancelOnPress: () {},
                          //   //     btnOkOnPress: () {
                          //   //       Navigator.push(
                          //   //           context,
                          //   //           MaterialPageRoute(
                          //   //             builder: (context) =>
                          //   //                 const HomeLayout(),
                          //   //           ));
                          //   //     },
                          //   //   ).show();
                          //   // } on FirebaseAuthException catch (e) {
                          //   //   if (e.code == 'user-not-found') {
                          //   //     print('No user found for that email.');
                          //   //     AwesomeDialog(
                          //   //       context: context,
                          //   //       dialogType: DialogType.error,
                          //   //       animType: AnimType.rightSlide,
                          //   //       title: ' error',
                          //   //       desc: 'No user found for that email.',
                          //   //       btnCancelOnPress: () {},
                          //   //       btnOkOnPress: () {},
                          //   //     ).show();
                          //   //     setState(() {});
                          //   //   } else if (e.code == 'wrong-password') {
                          //   //     print('Wrong password provided for that user.');
                          //   //     AwesomeDialog(
                          //   //       context: context,
                          //   //       dialogType: DialogType.error,
                          //   //       animType: AnimType.rightSlide,
                          //   //       title: 'error',
                          //   //       desc:
                          //   //           'Wrong password provided for that user.',
                          //   //       btnCancelOnPress: () {},
                          //   //       btnOkOnPress: () {},
                          //   //     ).show();
                          //   //     setState(() {});
                          //   //   }
                          //   // }
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
  }
}
