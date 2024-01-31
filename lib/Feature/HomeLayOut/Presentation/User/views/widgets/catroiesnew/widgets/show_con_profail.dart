import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/User/views/widgets/Catroies/customLine.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/my_state.dart';

import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ConsltantProfailgrenal extends StatefulWidget {
  const ConsltantProfailgrenal({super.key, required this.i, required this.uid});
  final int i;
  final String uid;

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
                          child: InkWell(
                            onTap: () {
                              // SocailBloc.get(context).getCover();
                            },
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
                        ),
                        Positioned(
                          bottom: -50,
                          child: InkWell(
                            onTap: () {
                              // SocailBloc.get(context).getImageProfail();
                            },
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
                                      value: 'Chat',
                                      child: Row(
                                        children: [
                                          Icon(Icons.chat),
                                          SizedBox(width: 5),
                                          Text('Chat'),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'prodelm',
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
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const Setting(),
                                      //   ),
                                      // );
                                    } else if (value == 'Chat') {
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => chatDeatiles(),
                                      //   ),
                                      // );
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
                    const customLine(),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isSomeWorkPressed = !isSomeWorkPressed;
                                // Reset the other button state
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "SomeWork",
                                  style: Styles.textStyle18.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  color: isSomeWorkPressed
                                      ? primarycolor
                                      : Colors.transparent,
                                  height: 2,
                                  width: double.infinity,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Rating",
                                    style: Styles.textStyle18.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    color: isSomeWorkPressed
                                        ? Colors.transparent
                                        : primarycolor,
                                    height: 2,
                                    width: double.infinity,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const customLine(),
                    const SizedBox(
                      height: 5,
                    ),
                    isSomeWorkPressed
                        ? ListPostItemsworkcon(
                            uid: MyBloc.get(context)
                                .listshowAllConsltant[widget.i]['uid'],
                          )
                        : Text("00000000000")
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ListPostItemsworkcon extends StatelessWidget {
  const ListPostItemsworkcon({
    super.key,
    required this.uid,
  });
  final String uid;
  @override
  Widget build(BuildContext context) {
    final myBloc = MyBloc.get(context);

    if (myBloc.listPrivateworkConsultant.isEmpty) {
      return Center(
        child: Text(
          uid,
          style: Styles.textStyle20,
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      itemCount: myBloc.listPrivateworkConsultant.length,
      itemBuilder: (context, index) => PostItemsSomeWork(),
    );
  }
}

class PostItemsSomeWork extends StatelessWidget {
  const PostItemsSomeWork({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
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
                backgroundImage: CachedNetworkImageProvider(
                  "",
                ),
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
                          "",
                          style: Styles.textStyle16,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                    Text(
                      "Ahmed",
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              child: Text("{model.text}", style: Styles.textStyle16),
            ),
          ),
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  "{model.postImage}",
                ),
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
    );
  }
}
