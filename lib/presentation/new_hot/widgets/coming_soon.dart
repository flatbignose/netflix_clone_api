import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app_api/core/constants.dart';
import '../../../infrastructure/movie/movie.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final String apiDate = movie.releaseDate!;
    DateTime date = DateTime.parse(apiDate);
    final String releaseDate = DateFormat.MMMd().format(date);
    final String releaseDay = DateFormat.EEEE().format(date);
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 380,
          child: Column(
            children: [
              Text(
                releaseDate,
                style: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: movie.backdropPath!),
              kHeight20,
              Row(
                children: [
                  Text(
                    movie.title!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const CustomButton(
                    icon: Icons.alarm,
                    text: 'Remind Me',
                    size: 20,
                    textSize: 11,
                  ),
                  kwidth,
                  const CustomButton(
                    icon: Icons.info_outline_rounded,
                    text: 'Info',
                    size: 20,
                    textSize: 11,
                  ),
                  kwidth
                ],
              ),
              Text('Coming on $releaseDay'),
              kHeight10,
              Text(
                movie.title!,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                movie.overview!,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}

void dateFormatter(DateTime date) {}
