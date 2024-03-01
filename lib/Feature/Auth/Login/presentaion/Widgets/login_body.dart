import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/home_screen.dart';
import 'package:flutter_application_1/Feature/Auth/Login/mangment/LoginBloc.dart';
import 'package:flutter_application_1/Feature/Auth/Login/mangment/LoginState.dart';
import 'package:flutter_application_1/Feature/Auth/Login/presentaion/Widgets/custom_button_auth%20.dart';
import 'package:flutter_application_1/Feature/Auth/Login/presentaion/Widgets/custom_text_form.dart';
import 'package:flutter_application_1/Feature/Auth/Login/presentaion/Widgets/forget_password.dart';
import 'package:flutter_application_1/Feature/Auth/Login/presentaion/Widgets/text_login.dart';
import 'package:flutter_application_1/Feature/Auth/Regiter/presentaion/views/register_screen.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var email = BlocProvider.of<LoginBloc>(context).email;
    var password = BlocProvider.of<LoginBloc>(context).password;
    var formkey = BlocProvider.of<LoginBloc>(context).formkey;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: BlocProvider.of<LoginBloc>(context).formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(16),
                    const Logo(),
                    Gap(30),
                    Center(
                      child: TextLogin(text: "Login"),
                    ),
                    Gap(40),
                    Text(
                      "Email",
                      style: Styles.textStyle18.copyWith(
                        color: Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? Colors.white
                            : scoundColor,
                      ),
                    ),
                    Gap(3),
                    CustomTextForm(
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      hinttext: "ُEnter Your Email",
                      mycontroller: BlocProvider.of<LoginBloc>(context).email,
                      validator: (val) {
                        if (val == "") {
                          tost(
                              text: "Email Cant de Empty",
                              state: ToastState.eror);
                        }
                        return null;
                      },
                    ),
                    Gap(35),
                    Text(
                      "password",
                      style: Styles.textStyle18.copyWith(
                        color: Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? Colors.white
                            : scoundColor,
                      ),
                    ),
                    Gap(3),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return PasswordTextFiled(
                          suffixIcon: IconButton(
                            onPressed: () {
                              LoginBloc.get(context).changepassWord();
                            },
                            icon: Icon(LoginBloc.get(context).icon),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          hinttext: "ُEnter Your password",
                          mycontroller: password,
                          validator: (val) {
                            if (val == "") {
                              tost(
                                  text: "Email Cant de password",
                                  state: ToastState.eror);
                            }
                            return null;
                          },
                          obscureText: LoginBloc.get(context).obscureText,
                        );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Forgetpassword(),
                            ));
                      },
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
                                : scoundColor,
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
                          if (email.text == emailAdimin &&
                              password.text == passwordAdmin) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminHome(),
                                ));
                            tost(text: "login Admin", state: ToastState.succes);
                          } else if (formkey.currentState!.validate()) {
                            LoginBloc.get(context).loginUser();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.nameKey);
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
                                  : scoundColor,
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

class PasswordTextFiled extends StatelessWidget {
  const PasswordTextFiled(
      {super.key,
      required this.hinttext,
      required this.mycontroller,
      this.validator,
      this.keyboardType,
      this.suffixIcon,
      required this.obscureText,
      this.textAlign});
  final String hinttext;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      controller: mycontroller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hinttext,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
