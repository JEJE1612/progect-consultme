import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/widgets/list_post_Item_swork.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/back_ground_profail_user.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/information_user.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/rating/mangment/cubit/rating_cubit.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/rating/widget/rating_reviews.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfailConsultant extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final UserModel? model;
  ProfailConsultant({
    super.key,
    this.model,
  });

  @override
  State<ProfailConsultant> createState() => _ProfailConsultantState();
}

class _ProfailConsultantState extends State<ProfailConsultant> {
  bool isSomeWorkPressed = true;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {
        if (state is SuccessDeletesomeWorkid) {
          tost(
            text: "Sucessfull Delete",
            state: ToastState.succes,
          );
        }
      },
      builder: (context, state) {
        var model = MyBloc.get(context).usermodel;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackGroundProfailUser(
                    model: model,
                    size: size,
                  ),
                  InformationUser(
                    model: model,
                  ),
                  const CustomLine(),
                  Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isSomeWorkPressed = !isSomeWorkPressed;
                                // Reset the other button state
                              });
                            },
                            child: Text(
                              "SomeWork",
                              style: Styles.textStyle18.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Gap(5),
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: isSomeWorkPressed
                                ? primarycolor
                                : Colors.transparent,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          await BlocProvider.of<RatingCubit>(context)
                              .getAllRating(uidd: model!.uid!);
                          setState(() {
                            isSomeWorkPressed = !isSomeWorkPressed;
                            // Reset the other button state
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Reating ",
                              style: Styles.textStyle18.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            Gap(5),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: isSomeWorkPressed
                                  ? Colors.transparent
                                  : primarycolor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const CustomLine(),
                  const SizedBox(height: 10),
                  isSomeWorkPressed
                      ? const ListPostItemswork()
                      : Ratingviews(
                          consltantUid: model!.uid!,
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
