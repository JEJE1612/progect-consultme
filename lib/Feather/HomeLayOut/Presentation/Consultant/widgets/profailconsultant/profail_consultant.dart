import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/widgets/add_some_work.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/widgets/edit_profail_consultant.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/widgets/list_post_Item_swork.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/Post/Rating_Reviews.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/information_user.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfailConsultant extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final UserModel? model;
  ProfailConsultant({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is SuccessDeletesomeWorkid) {
          tost(
            text: "Scafull Delets",
            state: ToastStae.succes,
          );
        }
      },
      builder: (context, state) {
        var model = MyBloc.get(context).usermodel;
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
                        child: Container(
                          height: size.height * 0.23,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "${model?.cover}",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.white),
                          child: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                              model!.image!,
                            ),
                            radius: 48,
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
                                    value: 'Ask',
                                    child: Row(
                                      children: [
                                        Icon(Icons.add),
                                        SizedBox(width: 5),
                                        Text('Add work'),
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
                                        builder: (context) =>
                                            const EditProfailConsultant(),
                                      ),
                                    );
                                  } else if (value == 'Ask') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AddSomeWork(),
                                        ));
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InformationUser(
                    model: model,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.javascript_outlined,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Job title ",
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const customLine(),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "SomeWork",
                            style: Styles.textStyle18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RatingReviews(),
                              ),
                            );
                          },
                          child: Text(
                            "Reating",
                            style:
                                Styles.textStyle18.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const customLine(),
                  const SizedBox(
                    height: 10,
                  ),
                  const ListPostItemswork(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
