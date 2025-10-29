import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final void Function(double)? onRate;

  const RatingStars({super.key, required this.rating, this.size = 18, this.onRate});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: onRate != null ? () => onRate!(index + 1.0) : null,
          child: Icon(
            index < rating ? Icons.star : Icons.star_border,
            size: size,
            color: Colors.amber,
          ),
        );
      }),
    );
  }
}