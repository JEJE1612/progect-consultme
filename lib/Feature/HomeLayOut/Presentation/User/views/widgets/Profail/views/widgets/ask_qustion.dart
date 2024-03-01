import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AskQustion extends StatefulWidget {
  const AskQustion({super.key});

  @override
  State<AskQustion> createState() => _AskQustionState();
}

class _AskQustionState extends State<AskQustion> {
  var textControll = TextEditingController();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is RemoveAskImage) {
          MyBloc.get(context).imageAsk = null;
        } else if (state is ScafullUploadAskImageState) {
          Navigator.pop(context);
          textControll.clear();
          MyBloc.get(context).imageAsk = null;
        } else if (state is ScafullCreatAskUser) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAppBarAbmin(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: "Ask"),
                        MaterialButton(
                          onPressed: () {
                            if (MyBloc.get(context).imageAsk == null) {
                              MyBloc.get(context).creatAddPhoto(
                                imagecat: "",
                                dateTime: time.toString(),
                                text: textControll.text,
                              );
                            } else {
                              MyBloc.get(context).uploadAskImage(
                                date: time.toString(),
                                text: textControll.text,
                                postImage: "",
                              );
                            }
                            // MyBloc.get(context)
                            //     .choosemycategoryinAsk(
                            //       selectedType['text'],

                            //       );
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Ask",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const CustomLine(),
                    const SizedBox(
                      height: 2,
                    ),
                    if (state is LodingCreatAskUser)
                      const LinearProgressIndicator(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    // DropdownButton(
                    //   items: MyBloc.get(context).catroies.map((value) {
                    //     return DropdownMenuItem(
                    //       value: value,
                    //       child: Text(
                    //         '${value['text']}',
                    //         style: const TextStyle(color: primarycolor),
                    //       ),
                    //     );
                    //   }).toList(),
                    //   onChanged: (selectedAccountType) {
                    //     print('$selectedAccountType');
                    //     setState(() {
                    //       selectedType = selectedAccountType;
                    //     });
                    //   },
                    //   value: selectedType,
                    //   isExpanded: false,
                    //   hint: Text(
                    //     'Choose Your Category',
                    //     style: Styles.textStyle20,
                    //   ),
                    // ),
                    Gap(10),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.13,
                    //   child: ListView.separated(
                    //     scrollDirection: Axis.horizontal,
                    //     separatorBuilder: (context, index) => SizedBox(
                    //       width: 5,
                    //     ),
                    //     itemBuilder: (context, index) => ShowCatroiesIemsAsk(
                    //       model: MyBloc.get(context).catroies[index],
                    //       ontap: () {
                    //         if (index == 0) {
                    //           MyBloc.get(context).imageCatroiesAsk =
                    //               "https://firebasestorage.googleapis.com/v0/b/consultme-2be0e.appspot.com/o/user%2FIMG_20240131_230205_486.jpg?alt=media&token=9a180f15-4d97-4fd4-a571-8897779d53a7";
                    //         } if (index == 1) {
                    //           MyBloc.get(context).imageCatroiesAsk =
                    //               "https://firebasestorage.googleapis.com/v0/b/consultme-2be0e.appspot.com/o/user%2FIMG_20240131_230205_486.jpg?alt=media&token=9a180f15-4d97-4fd4-a571-8897779d53a7";
                    //         }
                    //       },
                    //     ),
                    //     itemCount: MyBloc.get(context).catroies.length,
                    //   ),
                    // ),
                    TextField(
                      onChanged: (value) {
                        textControll.text = value;
                      },
                      controller: textControll,
                      maxLines: 6,
                      decoration: InputDecoration(
                          hintText: "AskQustion",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const CustomLine(),
                    InkWell(
                      onTap: () {
                        MyBloc.get(context).getImagePhotogallery();
                      },
                      child: Center(
                        child: Text(
                          "AddPhoto",
                          style: Styles.textStyle20,
                        ),
                      ),
                    ),
                    const CustomLine(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    if (MyBloc.get(context).imageAsk != null)
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
                                        MyBloc.get(context).imageAsk!),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                MyBloc.get(context).removeImageAsk();
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
                  ]),
            ),
          ),
        );
      },
    );
  }
}

// class ShowCatroiesIemsAsk extends StatelessWidget {
//   const ShowCatroiesIemsAsk({
//     super.key,
//     required this.model,
//     required this.ontap,
//   });
//   final CatroiesModel model;
//   final VoidCallback ontap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: CircleAvatar(
//         backgroundImage: CachedNetworkImageProvider(
//           model.catoiesImage ?? AssetsData.allCatrois_icon,
//         ),
//         radius: 40,
//         child: Text('${model.text}'),
//       ),
//     );
//   }
// }
