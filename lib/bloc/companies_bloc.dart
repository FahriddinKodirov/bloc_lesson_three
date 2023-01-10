import 'package:bloc_lesson_three/bloc/companies_event.dart';
import 'package:bloc_lesson_three/bloc/companies_state.dart';
import 'package:bloc_lesson_three/data/model/my_response/my_response.dart';
import 'package:bloc_lesson_three/data/repositories/companies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
 final CompaniesRepo companiesRepo;

 CompaniesBloc(this.companiesRepo):super(InitialCompaniesState()) {
  on<FetchAllCompanies>(_fetchAllCompanies);
  on<FetchSingleCompanies>(_fetchSingleCompanies);
 }

 _fetchAllCompanies(FetchAllCompanies event, Emitter<CompaniesState> emit) async {
  emit(LoadCompaniesInProgress());

  MyResponse myResponse = await companiesRepo.getAllCompanies();
  if(myResponse.error.isEmpty){
    emit(LoadCompaniesInSuccess(companies: myResponse.data));
  } else {
    emit(LoadCompaniesInFairlure(errorText: myResponse.error));
  }
 }

 _fetchSingleCompanies(FetchSingleCompanies event, Emitter<CompaniesState> emit) async {
  emit(LoadDetailedInProgress());

  MyResponse myResponse = await companiesRepo.getSingleCompanies(event.id);
  if(myResponse.error.isEmpty){
    emit(LoadDetailedInSuccess(detailed: myResponse.data));
  } else {
    emit(LoadCompaniesInFairlure(errorText: myResponse.error));
  }
 }
}