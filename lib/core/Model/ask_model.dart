class AskModel {
  String? name;
  String? uId;
  String? image;
  String? postImage;
  String? dateTime;
  String? text;
  String? docId;
  String? imagecat;

  AskModel({
    required this.name,
    required this.text,
    required this.uId,
    required this.image,
    required this.postImage,
    required this.dateTime,
    required this.imagecat,
    this.docId,
  });
  AskModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    name = json['name'];
    postImage = json['postImage'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    docId = json['docId'];
    imagecat = json['imagecat'];
  }
  Map<String, dynamic> toMap() {
    return {
      'imagecat': imagecat,
      'name': name,
      'uId': uId,
      'image': image,
      'text': text,
      'postImage': postImage,
      'dateTime': dateTime,
      'docId': docId,
    };
  }
}
