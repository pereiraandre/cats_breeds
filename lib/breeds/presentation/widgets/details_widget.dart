import 'package:flutter/cupertino.dart';

class DetailsWidget extends StatelessWidget {
  String breed;
  String country;
  String coat;
  String pattern;

  DetailsWidget(
      {super.key,
      required this.breed,
      required this.country,
      required this.coat,
      required this.pattern});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Breed:', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),),
        Text(
          breed,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text('Country:', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),),
        Text(
          country,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text('Coat:', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),),
        Text(
          coat,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text('Pattern:', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),),
        Text(
          pattern,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
