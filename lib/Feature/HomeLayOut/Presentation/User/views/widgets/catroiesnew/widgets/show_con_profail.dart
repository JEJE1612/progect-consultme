import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/add_Rate/widgets/add_rate_button.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/block_con.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/build_list_con_work.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/catroiesnew/widgets/postItems_some_work_con.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc-get_con/get_con_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/rating/mangment/cubit/rating_cubit.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/rating/widget/rating_reviews.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ConsltantProfailgrenal extends StatefulWidget {
  const ConsltantProfailgrenal({
    super.key,
    required this.i,
  });
  final int i;

  @override
  State<ConsltantProfailgrenal> createState() => _ConsltantProfailgrenalState();
}

class _ConsltantProfailgrenalState extends State<ConsltantProfailgrenal> {
  bool isSomeWorkPressed = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: AddRatingButton(uid: MyBloc.get(context)
                                    .listshowAllConsltant[widget.i]['uid']),
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
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                MyBloc.get(context)
                                    .listshowAllConsltant[widget.i]['cover'],
                              ),
                            )),
                          ),
                        ),
                        Positioned(
                          bottom: -50,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                color: Colors.white),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                MyBloc.get(context)
                                    .listshowAllConsltant[widget.i]['image'],
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
                                      value: 'Probelm',
                                      child: Row(
                                        children: [
                                          Icon(Icons.horizontal_distribute),
                                          SizedBox(width: 5),
                                          Text('prodelm'),
                                        ],
                                      ),
                                    ),
                                  ],
                                  onSelected: (value) {
                                    if (value == 'prodelm') {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Blockconsultant(
                                              name: MyBloc.get(context)
                                                      .listshowAllConsltant[
                                                  widget.i]['name'],
                                              imageco: MyBloc.get(context)
                                                      .listshowAllConsltant[
                                                  widget.i]['image']),
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
                    Gap(50),
                    Row(
                      children: [
                        Text(
                          MyBloc.get(context).listshowAllConsltant[widget.i]
                              ['name'],
                          style: Styles.textStyle18,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Gap(5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                MyBloc.get(context)
                                    .listshowAllConsltant[widget.i]['bio'],
                                style: Styles.textStyle16.copyWith(
                                  color: Theme.of(context)
                                              .colorScheme
                                              .brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              Gap(6),
                              Text(
                                MyBloc.get(context)
                                    .listshowAllConsltant[widget.i]['type'],
                                style: Styles.textStyle16.copyWith(
                                  color: Theme.of(context)
                                              .colorScheme
                                              .brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            MyBloc.get(context).listshowAllConsltant[widget.i]
                                ['phone'],
                            style: Styles.textStyle14
                                .copyWith(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                    Gap(10),
                    const CustomLine(),
                    Row(
                      children: [
                        InkWell(
                          child: Column(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    color: isSomeWorkPressed
                                        ? primarycolor
                                        : Colors.transparent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await BlocProvider.of<RatingCubit>(context)
                                .getAllRating(
                                    uidd: MyBloc.get(context)
                                        .listshowAllConsltant[widget.i]['uid']);
                            setState(() {
                              isSomeWorkPressed = !isSomeWorkPressed;

                              // Reset the other button state
                            });
                          },
                          child: Column(
                            children: [
                              Column(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    color: isSomeWorkPressed
                                        ? Colors.transparent
                                        : primarycolor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(2),
                    const CustomLine(),
                    const SizedBox(
                      height: 5,
                    ),
                    Gap(5),
                    isSomeWorkPressed
                        ? BuildListConWork(
                            uid: MyBloc.get(context)
                                .listshowAllConsltant[widget.i]['uid'],
                          )
                        : Ratingviews(
                            consltantUid: MyBloc.get(context)
                                .listshowAllConsltant[widget.i]['uid']),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class Ratingviewscon extends StatelessWidget {
  const Ratingviewscon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingCubit(),
      child: BlocConsumer<RatingCubit, RatingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => PostItemsSomeWorkCon(
              model: GetConsultnt.get(context).someWorkco[index],
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 5,
            ),
            itemCount: GetConsultnt.get(context).someWorkco.length,
          );
        },
      ),
    );
  }
}
