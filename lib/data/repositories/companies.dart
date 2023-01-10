import 'package:bloc_lesson_three/data/api_service/api_service.dart';
import 'package:bloc_lesson_three/data/model/my_response/my_response.dart';

class CompaniesRepo {
  final ApiService apiService;

  CompaniesRepo({required this.apiService});

  Future<MyResponse> getAllCompanies() => apiService.getAllCompanies();
  Future<MyResponse> getSingleCompanies(int id) => apiService.getSingleCompanies(id);
}