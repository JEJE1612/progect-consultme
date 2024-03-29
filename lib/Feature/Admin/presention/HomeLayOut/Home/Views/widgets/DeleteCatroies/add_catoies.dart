import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/Mangment/admin_bloc.dart';
import 'package:flutter_application_1/Feature/Admin/Mangment/admin_bloc_state.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCatroies extends StatefulWidget {
  static const String nameKey = "NewCatroies";

  const NewCatroies({super.key});

  @override
  State<NewCatroies> createState() => _NewCatroiesState();
}

class _NewCatroiesState extends State<NewCatroies> {
  var textControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DateTime time = DateTime.now();
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state is RemovecatroiesImage) {
          AdminBloc.get(context).catroiesImage = null;
        }
        if (state is LodingUploadCrtroiesmageState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ScafullUploadCatroiesImageState) {
          AdminBloc.get(context).getCaroies();
          AdminBloc.get(context).catroiesImage = null;
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomAppBarAbmin(
                        title: "Add Catoies",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (AdminBloc.get(context).catroiesImage == null) {
                            AdminBloc.get(context).creatPost(
                              text: textControll.text,
                              datetime: time.toString(),
                            );
                          } else {
                            AdminBloc.get(context).uploadCatroiesImageImage(
                              date: time.toString(),
                              text: textControll.text,
                              postImage: "",
                            );
                          }
                          //  AdminBloc.get(context).posts.clear();
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  if (state is LodingCreatCatroies)
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                  if (state is LodingUploadCrtroiesmageState)
                    const Center(child: CircularProgressIndicator()),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        // Update the value in the controller when the text changes
                        textControll.text = value;
                      },
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
                  if (AdminBloc.get(context).catroiesImage != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: FileImage(
                                      AdminBloc.get(context).catroiesImage!),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              AdminBloc.get(context).removeImgePOst();
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
                  if (AdminBloc.get(context).catroiesImage == null)
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Pleas choose photo!!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  const Divider(height: 20, thickness: 0.5, color: Colors.grey),
                  CircleAvatar(
                    backgroundColor: primarycolor,
                    radius: 30,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            AdminBloc.get(context).getcatroiesImage();
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 34,
                            color: Colors.white,
                          )),
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
