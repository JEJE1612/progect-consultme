import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/ProfailAdmin/edit_profail_admin.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/information_user.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:gap/gap.dart';

class ProfailBodyAdmin extends StatelessWidget {
  const ProfailBodyAdmin({
    super.key,
    required this.size,
    required this.model,
  });

  final Size size;
  final UserModel? model;

  @override
  Widget build(BuildContext context) {
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
                            image: CachedNetworkImageProvider(
                              "${model?.cover}",
                              errorListener: (p0) => Text(""),
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
                        Gap(5),
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
                            ],
                            onSelected: (value) {
                              // Handle selection here
                              if (value == 'update') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfailAdmin(),
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
              Gap(60),
              InformationUser(model: model),
            ],
          ),
        ),
      ),
    );
  }
}
