import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Authe/Login/presentaion/Widgets/text_login.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/Feather/Authe/Login/presentaion/Widgets/custom_button_auth%20.dart';
import 'package:flutter_application_1/Feather/Authe/Login/presentaion/Widgets/custom_text_form.dart';
import 'package:flutter_application_1/Feather/Authe/Login/presentaion/views/login_screen.dart';
import 'package:flutter_application_1/Feather/Authe/Regiter/presentaion/Mangment/CreatAccoubtState.dart';
import 'package:flutter_application_1/Feather/Authe/Regiter/presentaion/Mangment/creatAccountBloc.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  static const String nameKey = "RedisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController namme = TextEditingController();

  TextEditingController phone = TextEditingController();

  var formkey = GlobalKey<FormState>();
  String? typeclient;
  bool values = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatAccount(),
      child: BlocConsumer<CreatAccount, CratAccountState>(
        listener: (context, state) {
          if (state is CreatUserLodingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ScafullCreatUserState) {
            tost(text: "Scaffull Login ", state: ToastState.succes);
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.nameKey, (route) => false);
          } else if (state is ErrorCrestLodingState) {
            tost(text: state.error, state: ToastState.eror);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                          const Logo(),
                          Gap(16),
                          Center(
                            child: TextLogin(
                              text: "Sign Up",
                            ),
                          ),
                          Gap(10),
                          Text(
                            "Name",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : scoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            hinttext: "ُEnter Your name",
                            mycontroller: namme,
                            validator: (val) {
                              if (val == "") {
                                tost(
                                    text: "Name Cant de empety",
                                    state: ToastState.eror);
                              }
                              return null;
                            },
                          ),
                          Gap(10),
                          Text(
                            "Email",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : scoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            hinttext: "ُEnter Your Email",
                            mycontroller: email,
                            validator: (val) {
                              if (val == "") {
                                tost(
                                    text: "Email Cant de empety",
                                    state: ToastState.eror);
                              }
                              return null;
                            },
                          ),
                          Gap(10),
                          Text(
                            "Phone",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : scoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                            hinttext: "ُEnter Your phone",
                            mycontroller: phone,
                            validator: (val) {
                              if (val == "") {
                                tost(
                                    text: "Phone Cant de empety",
                                    state: ToastState.eror);
                              }
                              return null;
                            },
                          ),
                          Gap(10),
                          Text(
                            "password",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : scoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            hinttext: "ُEnter Your password",
                            mycontroller: password,
                            validator: (val) {
                              if (val == "") {
                                tost(
                                    text: "password Cant de empety",
                                    state: ToastState.eror);
                              }
                              return null;
                            },
                          ),
                          Gap(15),
                          Text(
                            "type:",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : scoundColor,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RadioListTile(
                                  selected: values,
                                  title: const Text(
                                    'consulting',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'consulting',
                                  onChanged: (value) {
                                    values = true;
                                    typeclient = "consulting";
                                    CreatAccount.get(context)
                                        .changeIsAdmin(typeclient!);
                                  },
                                  groupValue: typeclient,
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  selected: values,
                                  title: const Text('client',
                                      style: TextStyle(color: Colors.black)),
                                  value: "client",
                                  groupValue: typeclient,
                                  onChanged: (value) {
                                    values = true;
                                    typeclient = value;
                                    CreatAccount.get(context)
                                        .changeIsAdmin(typeclient!);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Gap(15),
                          SizedBox(
                            width: double.infinity,
                            child: CustomButtonAuth(
                              title: "SignUp",
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  CreatAccount.get(context).userRegister(
                                      email: email.text,
                                      password: password.text,
                                      phone: phone.text,
                                      name: namme.text,
                                      type: typeclient!);
                                }
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
