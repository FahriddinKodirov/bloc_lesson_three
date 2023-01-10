import 'package:bloc_lesson_three/data/model/all_companies/companies_model.dart';
import 'package:bloc_lesson_three/data/model/detailed_company/detailed_model.dart';

abstract class CompaniesState {}

class InitialCompaniesState extends CompaniesState {}

// --------------- all-----------------------------
class LoadCompaniesInProgress extends CompaniesState {}

class LoadCompaniesInSuccess extends CompaniesState {
  final CompaniesModel companies;
 
  LoadCompaniesInSuccess({required this.companies});
}

class LoadCompaniesInFairlure extends CompaniesState {
  final String errorText;
 
  LoadCompaniesInFairlure({required this.errorText});
}

// -------------- single -----------------------------------

class LoadDetailedInProgress extends CompaniesState {}

class LoadDetailedInSuccess extends CompaniesState {
  final DetaildeModel detailed;
 
  LoadDetailedInSuccess({required this.detailed});
}

class LoadDetailedInFairlure extends CompaniesState {
  final String errorText;
 
  LoadDetailedInFairlure({required this.errorText});
}