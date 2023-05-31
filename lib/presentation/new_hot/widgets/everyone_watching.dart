import 'package:flutter/material.dart';
import 'package:netflix_app_api/core/constants.dart';

import '../../../infrastructure/movie/movie.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/video_widget.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        Text(
          movie.title ?? 'unknown',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          movie.overview ?? 'Unknown',
          style: const TextStyle(color: Colors.grey),
        ),
        kwidth,
        VideoWidget(image: movie.backdropPath!),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButton(
              icon: Icons.share,
              text: 'Share',
              size: 25,
              textSize: 12,
            ),
            kwidth,
            CustomButton(
              icon: Icons.add,
              text: 'Add',
              size: 25,
              textSize: 12,
            ),
            kwidth,
            CustomButton(
              icon: Icons.play_arrow_outlined,
              text: 'Play',
              size: 25,
              textSize: 12,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
