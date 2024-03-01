import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/rating/mangment/cubit/rating_cubit.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/mangment/rating/rating_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ratingviews extends StatelessWidget {
  const Ratingviews({super.key, required this.consltantUid});
  final String consltantUid;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingCubit, RatingState>(
      builder: (context, state) {
        if (state is RatingLoading) {
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 5,
          ));
        } else if (state is RatingSucess) {
          return RatingView(
            allRating: state.allRating,
          );
        } else if (state is RatingFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(
            child: MaterialButton(
              onPressed: () async {
                await BlocProvider.of<RatingCubit>(context)
                    .getAllRating(uidd: consltantUid);
              },
              child: Text("Update"),
              color: Colors.grey,
            ),
          );
        }
      },
    );
  }
}
