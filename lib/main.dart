import 'package:cats_breeds/breeds/data/breeds_service.dart';
import 'package:cats_breeds/breeds/models/breeds_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'breeds/bloc/breeds_cubit.dart';
import 'breeds/presentation/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreedsCubit(),
      child:  MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
