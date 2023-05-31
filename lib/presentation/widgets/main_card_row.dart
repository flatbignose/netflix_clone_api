import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../infrastructure/movie/movie.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainCardRow extends StatelessWidget {
  const MainCardRow({
    super.key,
    required this.title,
    required this.movies,
  });
  final String title;
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight10,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                movies.length,
                (index) => MainHomeCard(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${movies[index].posterPath}')),
          ),
        ),
        kHeight10,
      ],
    );
  }
}
