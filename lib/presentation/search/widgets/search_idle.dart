// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app_api/domain/functions.dart';
import 'package:netflix_app_api/infrastructure/movie/movie.dart';
import 'package:netflix_app_api/presentation/search/widgets/search_title.dart';
import '../../../core/constants.dart';

final List imageList = [
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/r1T00IkCwDc90nhCO2VFBV36PkI.jpg',
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/aAgGrfBwna1nO4M2USxwFgK5O0t.jpg',
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/51vreLbrGwzAg4WRCHgitWz6Naw.jpg',
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/4t0oBFrJyweYPt0hocW6RUa0b6H.jpg',
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/foc0hOprAdNpk1auscKqtipMtT5.jpg',
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/hcqY0Er8AhU3UiSAxB5tT6sBiZv.jpg',
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/T5xXoFqyc9jNXZIbH4Sw0jwWjw.jpg',
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/8W89QHsRBsonf8PyWdqdfGnOowp.jpg',
  'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/94TIUEhuwv8PhdIADEvSuwPljS5.jpg',
];

class WidgetSearchIdle extends StatelessWidget {
  WidgetSearchIdle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final List<Movie> movie = ApiFunctions.comingSoon +
      ApiFunctions.discover +
      ApiFunctions.nowPlaying +
      ApiFunctions.topRated +
      ApiFunctions.trending;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitle(title: title),
        kHeight10,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TopSearchTile(
                    movie: movie[index],
                    index: index,
                  ),
              separatorBuilder: (context, index) => kHeight20,
              itemCount: movie.length),
        )
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  const TopSearchTile({super.key, required this.index, required this.movie});
  final int index;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.35,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: kRadius10,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                  fit: BoxFit.cover)),
        ),
        Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        Icon(
          Icons.play_circle_outline_rounded,
          color: Colors.white,
          size: 50,
        )
      ],
    );
  }
}
