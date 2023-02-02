import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../bloc/breeds_cubit.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<BreedsCubit>(context).getBreeds();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<BreedsCubit>(context).getBreeds();
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: BlocConsumer<BreedsCubit, BreedsState>(
        listenWhen: (oldState, newState) => newState is BreedsError,
        listener: (context, state) {
          if (state is BreedsError) {
            Fluttertoast.showToast(
                msg: state.errorMessage.toString(),
                gravity: ToastGravity.CENTER);
          }
        },
        bloc: BlocProvider.of<BreedsCubit>(context)..getBreeds(),
        buildWhen: (oldState, newState) =>
            newState is BreedsLoading || newState is BreedsLoaded,
        builder: (context, state) {
          if (state is BreedsLoading) {
            return const CircularProgressIndicator();
          } else if (state is BreedsLoaded) {
            if(BlocProvider.of<BreedsCubit>(context).page < 6) {
              return ListView.builder(
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  if(index < state.breeds.length) {
                    return Card(
                    child: ListTile(
                      selectedTileColor: Colors.blue,
                      title: Center(
                          child: Text(
                         '${state.breeds[index].breed}',
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                    breed: state.breeds[index])));
                      },
                    ),
                  );
                  }else {
                    Timer(const Duration(milliseconds: 30), () {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    });

                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
                itemCount:
                state.breeds.length);
            }else{
              return const Center(child: Text('No more pages'));
            }
          }
          return Container();
        },
      ))),
    );
  }
}
