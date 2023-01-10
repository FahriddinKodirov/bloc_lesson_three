import 'package:bloc_lesson_three/bloc/companies_bloc.dart';
import 'package:bloc_lesson_three/bloc/companies_event.dart';
import 'package:bloc_lesson_three/bloc/companies_state.dart';
import 'package:bloc_lesson_three/data/repositories/companies.dart';
import 'package:bloc_lesson_three/screen/widget/dizayner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCompaniesScreen extends StatelessWidget {
  final int id;

  const SingleCompaniesScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => 
         CompaniesBloc(context.read<CompaniesRepo>())..add(FetchSingleCompanies(id: id)),
    child: Scaffold(
      appBar: AppBar(
      leading:IconButton(icon:const Icon(Icons.arrow_back,color: Colors.black,),onPressed: () => Navigator.pop(context),) ,
      elevation: 2,
      backgroundColor: Colors.grey[200],
      title: const Text('Detailed Page',style: TextStyle(color: Colors.black),),),
      body: BlocBuilder<CompaniesBloc, CompaniesState>(
        builder:(context, state) {
          if (state is InitialCompaniesState) {
            return const Center(
              child: Text("Hali data yo'q"),
            );
          } else if (state is LoadDetailedInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadDetailedInSuccess) {
            return DizaynerWidget(detaildeModel: state.detailed,);
            
          } else if (state is LoadDetailedInFairlure) {
            return Center(
              child: Text(
                state.errorText,
              ),
            );
          }
          return const SizedBox();
        },),
    ),
    
    );
  }
}