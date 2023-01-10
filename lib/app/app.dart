import 'package:bloc_lesson_three/bloc/companies_bloc.dart';
import 'package:bloc_lesson_three/data/api_service/api_service.dart';
import 'package:bloc_lesson_three/data/repositories/companies.dart';
import 'package:bloc_lesson_three/screen/all_companies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
          create: (context) => CompaniesRepo(apiService: ApiService()))
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllCompaniesScreeen(),
    );
  }
}
