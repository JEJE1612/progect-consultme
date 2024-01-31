import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/widget/rate_item.dart';
import 'package:flutter_application_1/core/Model/rating_model.dart';

class RatingView extends StatelessWidget {
  final List<RatingModel> allRating;

  const RatingView({super.key, required this.allRating});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        
        itemCount: allRating.length,
        itemBuilder: (context, index) => RateItem(
          rate: allRating[index],
        ),
      ),
    );
  }
}
