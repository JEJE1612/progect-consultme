class RatingModel {
  final String userName;
  final double rateValue;
  final String describe;
  final String image;
  final String uid;
  final DateTime date;
  RatingModel._(
      {required this.userName,
      required this.date,
      required this.uid,
      required this.rateValue,
      required this.describe,
      required this.image});
  factory RatingModel.fromjson({required Map<String, dynamic> rate}) {
    return RatingModel._(
      describe: rate[kDescribeRating],
      userName: rate[kUserName],
      rateValue: double.parse(rate[kRateValue]),
      image: rate[kImage],
      uid: rate["uid"],
      date: rate['dateTime'].toDate(),
    );
  }
}

const String kDescribeRating = "describeRating";
const String kUserName = "userName";
const String kRateValue = "rateValue";
const String kImage = "image";
