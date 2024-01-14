import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myBloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myState.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/Post/AddPost/NewPost.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/ChatSceen/ChatDeatiles.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Editprofail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/setting.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profail extends StatefulWidget {
  static const String nameKey = "Profail";

  const Profail({super.key});

  @override
  State<Profail> createState() => __ProfailState();
}

class __ProfailState extends State<Profail> {
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomLeft,
                    children: [
                      Card(
                        clipBehavior: Clip.none,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        elevation: 0.0,
                        child: InkWell(
                          onTap: () {
                            // SocailBloc.get(context).getCover();
                          },
                          child: Container(
                            height: size.height * 0.23,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AssetsData.backGroudprofail,
                              ),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        child: InkWell(
                          onTap: () {
                            // SocailBloc.get(context).getImageProfail();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                color: Colors.white),
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                AssetsData.testImage,
                              ),
                              radius: 48,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: Row(
                          children: [
                            const SizedBox(width: 5),
                            Material(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                              child: PopupMenuButton<String>(
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'update',
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit),
                                        SizedBox(width: 5),
                                        Text('Edit profail'),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 'Chat',
                                    child: Row(
                                      children: [
                                        Icon(Icons.chat),
                                        SizedBox(width: 5),
                                        Text('Chat'),
                                      ],
                                    ),
                                  ),
                                ],
                                onSelected: (value) {
                                  // Handle selection here
                                  if (value == 'update') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfail(),
                                      ),
                                    );
                                  } else if (value == 'Chat') {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => chatDeatiles(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahmed Mohmed",
                          style: Styles.textStyle18,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "Adout And Some information ",
                            style:
                                Styles.textStyle14.copyWith(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "01010657674",
                              style: Styles.textStyle14
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
