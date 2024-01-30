import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/GradViewBuilder.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/grad_view_builder_new.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/show_all_consultant.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Catroisbodynew extends StatelessWidget {
  const Catroisbodynew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = MyBloc.get(context);

          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Consultant Me",
                    style: Styles.textStyle20,
                  ),
                  Gap(16),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShowAllcon(),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage(
                              AssetsData.allCatrois_icon,
                            ),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(4, 8), // Shadow position
                            ),
                          ],
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "AllConsultant",
                              style: Styles.textStyle18
                                  .copyWith(color: Colors.white),
                            )),
                      )),
                    Gap(20),
                    GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bloc.catroiesnum.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.999,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      MyBloc.get(context).getCaroiestouser();
                      return GradViewBuilderNew(
                          model: bloc.catroiesuser[index],
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
