import 'package:flutter/material.dart';
import '../../models/breeds_model.dart';
import '../widgets/details_widget.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    Key? key,
    required this.breed,
  }) : super(key: key);
  Breed breed;

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
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DetailsWidget(
                    breed: breed.breed.toString(),
                    country: breed.country.toString(),
                    coat: breed.coat.toString(),
                    pattern: breed.pattern.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
