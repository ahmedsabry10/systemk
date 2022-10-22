class ClintModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text;
  String? postImage;



  ClintModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    this.postImage,
  });

  ClintModel.fromJson ( Map <String, dynamic>  json)
  {
    name = json ['name'];
    uId = json ['uId'];
    image = json ['image'];
    dateTime = json ['dateTime'];
    text = json ['text'];
    postImage = json ['postImage'];
  }

  Map <String, dynamic> toMap()
  {
    return {
      'name':name,
      'uId':uId,
      'dateTime':dateTime,
      'image':image,
      'text':text,
      'postImage':postImage,
    };
  }
}