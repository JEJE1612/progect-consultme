class ProblemModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text;
  String? docId;
  String? namco;
  String? imageco;

  ProblemModel({
    required this.namco,
    required this.imageco,
    required this.name,
    required this.text,
    required this.uId,
    required this.image,
    required this.dateTime,
    this.docId,
  });
  ProblemModel.fromJson(Map<String, dynamic> json) {
    text = json['namco'];
    name = json['imageco'];
    text = json['text'];
    name = json['name'];

    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    docId = json['docId'];
  }
  Map<String, dynamic> toMap() {
    return {
      'namco': namco,
      'imageco': imageco,
      'name': name,
      'uId': uId,
      'image': image,
      'text': text,
      'dateTime': dateTime,
      'docId': docId,
    };
  }
}
