import 'package:bloc_lesson_three/data/model/all_companies/data_model.dart';

class CompaniesModel {
  List<DataModel> data;

  CompaniesModel({required this.data});

  factory CompaniesModel.fromJson(Map<String, dynamic> jsonData) {
    return CompaniesModel(
      data: (jsonData['data'] as List).map((e) => DataModel.fromJson(e)).toList()
      );
  }
}