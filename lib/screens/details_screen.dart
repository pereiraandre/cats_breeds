import 'package:cats_breeds/widgets/details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../breeds/breeds_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    Key? key,
    this.breeds,
  }) : super(key: key);
  Breed? breeds;

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
                    breed: '${breeds?.breed.toString()}',
                    country: '${breeds?.country.toString()}',
                    coat: '${breeds?.coat.toString()}',
                    pattern: '${breeds?.pattern.toString()}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
