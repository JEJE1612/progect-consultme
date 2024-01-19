import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/core/utils/assets.dart';

class NewCatroies extends StatelessWidget {
  static const String nameKey = "NewCatroies";
  const NewCatroies({super.key});

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    var textControll = TextEditingController();
    //  DateTime time = DateTime.now();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 5),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBarAbmin(
                title: "Add Catoies",
                onPressed: () {},
              ),

              SizedBox(
                height: Size.height * 0.025,
              ),

              Expanded(
                child: TextFormField(
                  controller: textControll,
                  decoration: const InputDecoration(
                    hintText: " Catroies Name",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                    ),
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
                              AssetsData.backGroudprofail,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 34,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
