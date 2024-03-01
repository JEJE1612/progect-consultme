import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc/problem_bloc.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/bloc/problem_bloc_state.dart';
import 'package:flutter_application_1/core/Model/block-model.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Prodlem extends StatelessWidget {
  const Prodlem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProblemBloc()..getAllProblem(),
      child: BlocConsumer<ProblemBloc, Prodlemstae>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Column(
              children: [
                CustomAppBarAbmin(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: "Prodlem"),
                const SizedBox(
                  height: 10,
                ),
                ListViewProdlem(
                  allproblem: ProblemBloc.get(context).allproblem,
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}

class ListViewProdlem extends StatelessWidget {
  const ListViewProdlem({
    super.key,
    required this.allproblem,
  });

  final List<ProblemModel> allproblem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: ProblemBloc.get(context).allproblem.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 3,
        ),
        itemBuilder: (context, index) => ProdlemItems(
          model: ProblemBloc.get(context).allproblem[index],
        ),
      ),
    );
  }
}

class ProdlemItems extends StatelessWidget {
  const ProdlemItems({
    super.key,
    required this.model,
  });
  final ProblemModel? model;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 20.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    model?.image ?? "",
                  ),
                  radius: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model?.name ?? "",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                child: Text("${model?.text}", style: Styles.textStyle16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.grey,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      "${model?.imageco}",
                      errorListener: (p0) => AssetsData.logo,
                    ),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${model?.namco}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
