import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/BackGroundProfailUser.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/InformationUser.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/myBloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/myState.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class Profail extends StatelessWidget {
  static const String nameKey = "Profail";

  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  UserModel? model;
  Profail({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = MyBloc.get(context).usermodel;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackGroundProfailUser(size: size, model: model),
                  const SizedBox(
                    height: 50,
                  ),
                  InformationUser(model: model),
                  const customLine(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Text(
                        "Ask",
                        style:
                            Styles.textStyle18.copyWith(color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const customLine(),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    elevation: 20.0,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(AssetsData.logo),
                              radius: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "AhmedMohmed",
                                        //  "{post?.name}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "20/10/2000",
                                    // "${post!.dateTime?.substring(0, 10)}",
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black38),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuButton<String>(
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'update',
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(width: 5),
                                      Text('Update'),
                                    ],
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 'remove',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(width: 5),
                                      Text('Remove'),
                                    ],
                                  ),
                                ),
                              ],
                              onSelected: (value) {
                                // Handle selection here
                                if (value == 'update') {
                                } else if (value == 'remove') {}
                              },
                            ),
                          ],
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Ahmed",
                              // "{post.text}",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                height: 1.2,
                                textBaseline: TextBaseline.ideographic,
                              ),
                            ),
                          ),
                        ),
                        // if (post.postImage != "")
                        Container(
                          width: double.infinity,
                          height: 220,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AssetsData.backGroudprofail,
                                // "{post.postImage}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black38.withOpacity(0.2),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
