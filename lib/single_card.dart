import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  SingleCard({required this.number});
  int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10000000000000.0),
          child: Image.asset(
            'images/$number.png', // REQUIRED!!! path to the image must be between ' and '
            fit:
                BoxFit.cover, // set how image is contained in the parent widget
          ),
        ),
      ),
    );
  }
}
