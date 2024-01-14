import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/consltantProfail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Widgets/CustomButton.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class AddCatroes extends StatelessWidget {
  const AddCatroes({super.key});

  @override
  Widget build(BuildContext context) {
    var textControll = TextEditingController();
    //  DateTime time = DateTime.now();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 5),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // SocailBloc.get(context).getPost();
                      // SocailBloc.get(context).posts.clear();
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Add Catroies",
                        style: Styles.textStyle18,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.13,
                      ),
                      CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: "Add",
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(height: 20, thickness: 0.5, color: Colors.grey),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),

              Expanded(
                child: TextFormField(
                  controller: textControll,
                  decoration: const InputDecoration(
                    hintText: "  what is name Catroies",
                  ),
                ),
              ),
              // if (SocailBloc.get(context).imagepost != null)
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: const DecorationImage(
                            image: AssetImage(
                              AssetsData.logo,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // SocailBloc.get(context).removeImgePOst();
                      },
                      icon: const CircleAvatar(
                        child: Icon(
                          Icons.close_rounded,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(height: 20, thickness: 0.5, color: Colors.grey),

              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 34,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
