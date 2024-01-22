import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class HomeCuslatant extends StatelessWidget {
  const HomeCuslatant({super.key});

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Consultant Me",
                style: Styles.textStyle20,
              ),
              SizedBox(
                height: Size.height * 0.03,
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
                        CircleAvatar(
                          backgroundImage: AssetImage(AssetsData.logo),
                          radius: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "{post?.name}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const CircleAvatar(
                                    radius: 8,
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              // Text(
                              //   "${post!.dateTime?.substring(0, 10)}",
                              //   style: const TextStyle(fontSize: 12, color: Colors.black38),
                              // ),
                            ],
                          ),
                        ),
                        PopupMenuButton<String>(
                          itemBuilder: (context) => [
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
                            if (value == 'remove') {}
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
                          "{post.text}",
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
                          image: AssetImage(AssetsData.testImage),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
