class SectionModel {
  int? id;
  String? titleInAr;
  String? titleInEn;
  String? desInAr;
  String? desInEn;
  String? imagePath;

  SectionModel(
      {this.id,
      this.titleInAr,
      this.titleInEn,
      this.desInAr,
      this.desInEn,
      this.imagePath});

  SectionModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    titleInAr = data['titleInAr'];
    titleInEn = data['titleInEn'];
    desInAr = data['desInAr'];
    desInEn = data['desInEn'];
    imagePath = data['imagePath'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titleInAr': titleInAr,
      'titleInEn': titleInEn,
      'desInAr': desInAr,
      'desInEn': desInEn,
      'imagePath': imagePath
    };
  }
}
