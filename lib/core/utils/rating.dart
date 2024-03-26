import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  final int rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '$rating   ',
          style: Styles.semiboldStyle,
        ),
        Text('($ratingCount)', style: Styles.subtitleStyle),
      ],
    );
  }
}
