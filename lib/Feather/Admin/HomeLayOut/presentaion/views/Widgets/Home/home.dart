import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/Widgets/Home/Widgets/AddCatroes.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/Widgets/Home/Widgets/GridViewBuilderAdmin.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Widgets/CustomButton.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Consult Me",
                  style: Styles.textStyle20,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCatroes(),
                        ));
                  },
                  text: "Add",
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Catroies",
                  style: Styles.textStyle18,
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
            const GridViewBuilderAdmin(),
          ]),
        ),
      ),
    );
  }
}
