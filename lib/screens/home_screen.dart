import 'package:cats_breeds/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../breeds/breeds_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: BlocBuilder<BreedsCubit, BreedsState>(
        bloc: BlocProvider.of<BreedsCubit>(context)..getBreeds(),
        buildWhen: (oldState, newState) =>
            newState is BreedsLoading || newState is BreedsLoaded,
        builder: (context, state) {
          if (state is BreedsLoading) {
            return const CircularProgressIndicator();
          } else if (state is BreedsLoaded) {
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    selectedTileColor: Colors.blue,
                    title: Center(
                        child: Text(
                      '${state.breeds?.dataList[index].breed}',
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                    )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(index: index)));
                    },
                  );
                },
                itemCount: state.breeds?.dataList.length ?? 0);
          }
          return Container();
        },
      )),
    ));
  }
}
