import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/Widgets/Home/Widgets/AllUserBuilder.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/ListViewCatroisBuild.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class AllUser extends StatelessWidget {
  const AllUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    )),
                Text(
                  " All Consulatnt",
                  style: Styles.textStyle20,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    "5",
                    style: Styles.textStyle20.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const AllUserBuilder(),
          ]),
        ),
      ),
    );
  }
}
