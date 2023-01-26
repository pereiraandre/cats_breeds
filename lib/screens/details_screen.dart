import 'package:cats_breeds/breeds/breeds_cubit.dart';
import 'package:cats_breeds/widgets/details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<BreedsCubit, BreedsState>(
                builder: (context, state) {
                  if (state is BreedsLoaded) {
                    return DetailsWidget(
                        breed: '${state.breeds?.dataList[index].breed}',
                        country: '${state.breeds?.dataList[index].country}',
                        coat: '${state.breeds?.dataList[index].coat}',
                        pattern: '${state.breeds?.dataList[index].pattern}');
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
