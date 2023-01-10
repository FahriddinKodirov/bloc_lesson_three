abstract class CompaniesEvent{}

class FetchAllCompanies extends CompaniesEvent {}

class FetchSingleCompanies extends CompaniesEvent {
  final int id;
  FetchSingleCompanies({required this.id});
}