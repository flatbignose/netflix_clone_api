import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app_api/core/constants.dart';
import 'package:netflix_app_api/presentation/home/widgets/number_card.dart';

import 'package:netflix_app_api/presentation/widgets/main_title.dart';

import '../../domain/functions.dart';
import '../widgets/custom_button.dart';
import '../widgets/main_card_row.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) =>
          NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          if (direction == ScrollDirection.reverse) {
            scrollNotifier.value = false;
          } else if (direction == ScrollDirection.forward) {
            scrollNotifier.value = true;
          }
          return true;
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  BackgroundCard(),
                  MainCardRow(
                      title: 'Released in the Past Year',
                      movies: ApiFunctions.nowPlaying),
                  MainCardRow(
                      title: 'Trending Now', movies: ApiFunctions.trending),
                  const NumberRow(title: 'Top 10 TV Shows in India Today'),
                  MainCardRow(
                      title: 'Upcoming Heat', movies: ApiFunctions.comingSoon),
                  MainCardRow(
                      title: 'Explore New', movies: ApiFunctions.discover),
                ],
              ),
            ),
            scrollNotifier.value
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    width: double.infinity,
                    height: 90,
                    color: Colors.black.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png',
                                height: 30,
                                width: 30,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 27,
                              ),
                              kwidth,
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://wallpapers.com/images/high/netflix-profile-pictures-1000-x-1000-vnl1thqrh02x7ra2.webp'))),
                                height: 35,
                                width: 35,
                              ),
                              kwidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Tv Shows',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Text('Movies',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Text('Category',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : kwidth
          ],
        ),
      ),
    ));
  }
}

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${ApiFunctions.mainImage}'),
            ),
          ),
        ),
        Container(
          height: 500,
          color: Colors.black26,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomButton(
                  size: 30,
                  icon: Icons.add,
                  text: 'My List',
                  textSize: 17,
                ),
                PlayButton(),
                CustomButton(
                  icon: Icons.info,
                  text: 'Info',
                  size: 30,
                  textSize: 17,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white)),
        onPressed: () {},
        icon: const Icon(Icons.play_arrow, size: 30, color: Colors.black),
        label: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ));
  }
}

class NumberRow extends StatelessWidget {
  const NumberRow({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: MainTitle(title: title),
        ),
        kHeight10,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => NumberCard(
                      index: index,
                      image: ApiFunctions.topRated[index].posterPath!,
                    )),
          ),
        )
      ],
    );
  }
}
