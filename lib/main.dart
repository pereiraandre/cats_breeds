import 'package:cats_breeds/breeds/breeds_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cats_breeds/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreedsCubit(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
