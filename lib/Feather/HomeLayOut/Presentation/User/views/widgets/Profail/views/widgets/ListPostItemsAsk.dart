import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Profail/views/widgets/PostItemsAsk.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/myBloc.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class ListPostItemsAsk extends StatelessWidget {
  const ListPostItemsAsk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myBloc = MyBloc.get(context);

    if (myBloc.potoId.isEmpty) {
      return Center(
        child: Text(
          'No items available',
          style: Styles.textStyle20,
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 5,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: myBloc.potoId.length,
      itemBuilder: (context, index) => PostItemsAsk(
        model: myBloc.poto[index],
      ),
    );
  }
}
