class DetaildeModel {
  int id;
  int averagePrice;
  int establishedYear;
  String carModel;
  String logo;
  String description;
  List carPics;

  DetaildeModel(
     {required this.id,
      required this.averagePrice,
      required this.establishedYear,
      required this.carModel,
      required this.logo,
      required this.description,
      required this.carPics
      });
  
  factory DetaildeModel.fromJson(Map<String, dynamic> jsonData) {
    return DetaildeModel(
      id: jsonData['id'] ?? 0, 
      averagePrice: jsonData['average_price'] ?? 0, 
      establishedYear: jsonData['established_year'] ?? 0, 
      carModel: jsonData['car_model'] ?? '', 
      logo: jsonData['logo'] ?? '', 
      description: jsonData['description'] ?? '', 
      carPics: jsonData['car_pics'] ?? []
      );
  }
}