import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_api/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.index,
    required this.image
  });
  final int index;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500$image'))),
            ),
          ],
        ),
        Positioned(
            left: 0,
            bottom: -20,
            child: BorderedText(
              strokeWidth: 4,
              strokeColor: Colors.white,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 105,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            )),
      ],
    );
  }
}
