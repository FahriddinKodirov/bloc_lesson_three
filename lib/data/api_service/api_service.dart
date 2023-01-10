import 'package:bloc_lesson_three/data/api_service/api_client.dart';
import 'package:bloc_lesson_three/data/model/all_companies/companies_model.dart';
import 'package:bloc_lesson_three/data/model/detailed_company/detailed_model.dart';
import 'package:bloc_lesson_three/data/model/my_response/my_response.dart';
import 'package:dio/dio.dart';

class ApiService extends ApiClient {
  
  Future<MyResponse> getAllCompanies() async {

    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response = await dio.get('${dio.options.baseUrl}/companies');
      if(response.statusCode == 200) {
        myResponse.data =  CompaniesModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

     return myResponse;
  }

  Future<MyResponse> getSingleCompanies(int id) async {

    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response = await dio.get('${dio.options.baseUrl}/companies/$id');
      if(response.statusCode == 200) {
        myResponse.data =  DetaildeModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

     return myResponse;
  }
}