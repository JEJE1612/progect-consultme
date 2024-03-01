import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Auth/Login/presentaion/Widgets/custom_button_auth%20.dart';
import 'package:flutter_application_1/Feature/Auth/Login/presentaion/Widgets/custom_text_form.dart';
import 'package:flutter_application_1/Feature/Auth/Login/presentaion/Widgets/text_login.dart';
import 'package:flutter_application_1/Feature/Auth/Regiter/presentaion/Mangment/CreatAccoubtState.dart';
import 'package:flutter_application_1/Feature/Auth/Regiter/presentaion/Mangment/creatAccountBloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/Consultant/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/shared_presfrace.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  static const String nameKey = "RedisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatAccount, CratAccountState>(
      listener: (context, state) {
        if (state is CreatUserLoadingState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ScafullCreatUserState) {
          tost(text: "Create Email Succes ", state: ToastState.succes);
          var isCleint = BlocProvider.of<CreatAccount>(context).isClient;
          if (isCleint) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeLayOut.nameKey, (route) => false);
            CacheHealper.savedData(key: "AccountType", value: "client");
          } else {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeCosultant(),
                ),
                (route) => false);
            CacheHealper.savedData(key: "AccountType", value: "consulting");
          }
        } else if (state is ErrorCrestLodingState) {
          tost(text: state.error, state: ToastState.eror);
        }
      },
      builder: (context, state) {
        var formkey = BlocProvider.of<CreatAccount>(context).formkey;
        var email = BlocProvider.of<CreatAccount>(context).email;
        var password = BlocProvider.of<CreatAccount>(context).password;
        var name = BlocProvider.of<CreatAccount>(context).name;
        var phone = BlocProvider.of<CreatAccount>(context).phone;
        var isCleint = BlocProvider.of<CreatAccount>(context).isClient;
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
                          mycontroller: name,
                          validator: (val) {
                            if (val == "") {
                              return "this Feild is required";
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
                              return "this Feild is required";
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
                              return "this Feild is required";
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
                              return "this Feild is required";
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
                                selected: !isCleint,
                                title: const Text('consulting'),
                                value: 'consulting',
                                onChanged: (value) {
                                  BlocProvider.of<CreatAccount>(context)
                                      .type = value!;
                                  CreatAccount.get(context).changeIsAdmin();
                                },
                                groupValue: isCleint ? null : 'consulting',
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                selected: isCleint,
                                title: const Text('client'),
                                value: "client",
                                groupValue: isCleint ? "client" : null,
                                onChanged: (value) {
                                  BlocProvider.of<CreatAccount>(context)
                                      .type = value!;
                                  CreatAccount.get(context).changeIsAdmin();
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
                                CreatAccount.get(context).userRegister();
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
