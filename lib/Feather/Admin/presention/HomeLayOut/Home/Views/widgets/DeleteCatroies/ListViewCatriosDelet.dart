import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/DeleteCatroies/ItemsListViewDelete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewCatriosDelet extends StatelessWidget {
  const ListViewCatriosDelet({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        final catroiesBloc = AdminBloc.get(context);

        if (catroiesBloc.catroiesnum.isEmpty) {
          // Return a widget or message indicating that the list is empty.
          return Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: catroiesBloc.catroiesnum.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 0.999,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ItemsListViewDelete(
              catroiesBloc.catroies[index],
              catroiesBloc.catroiesnum[index],
              key: Key(index.toString()),
            );
          },
        );
      },
    );
  }
}
