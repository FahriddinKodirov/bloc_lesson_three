import 'package:bloc_lesson_three/bloc/companies_bloc.dart';
import 'package:bloc_lesson_three/bloc/companies_event.dart';
import 'package:bloc_lesson_three/bloc/companies_state.dart';
import 'package:bloc_lesson_three/data/repositories/companies.dart';
import 'package:bloc_lesson_three/screen/single_companise_screen.dart';
import 'package:bloc_lesson_three/util/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCompaniesScreeen extends StatelessWidget {
  const AllCompaniesScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CompaniesBloc(context.read<CompaniesRepo>())..add(FetchAllCompanies()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Companies'),
          
        ),
        body: BlocConsumer<CompaniesBloc, CompaniesState>(
          builder: (context, state) {
            if (state is InitialCompaniesState) {
              return const Center(
                child: Text('hali data yoq'),
              );
            } else if (state is LoadCompaniesInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCompaniesInSuccess) {
              return ListView.builder(
                itemCount: state.companies.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SingleCompaniesScreen(
                             id: state.companies.data[index].id,)));
                             
                    },
                    title: Text(state.companies.data[index].carModel),
                    trailing: Image.network(state.companies.data[index].logo),
                  );
                },
              );
            } else if (state is LoadCompaniesInFairlure) {
              return Text(state.errorText);
            }
            return const SizedBox();
          },
          listener: (context, state) {
            MyUtils.getMyToast(message: "Loading in progress...");
          },
        ),
      ),
    );
  }
}
