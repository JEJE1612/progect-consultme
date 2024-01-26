class RatingModel {
  final String userName;
  final double rateValue;
  final String describeRating;
  final String image;

  RatingModel._(
      {required this.userName,
      required this.rateValue,
      required this.describeRating,
      required this.image});
  factory RatingModel.fromjson({required Map<String, dynamic> allRating}) {
    return RatingModel._(
      describeRating: allRating[kDescribeRating],
      userName: allRating[kUserName],
      rateValue: allRating[kRateValue],
      image: allRating[kImage],
    );
  }
}

const String kDescribeRating = "describeRating";
const String kUserName = "userName";
const String kRateValue = "rateValue";
const String kImage = "image";
