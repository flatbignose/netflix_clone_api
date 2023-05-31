import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app_api/core/constants.dart';
import 'package:netflix_app_api/domain/functions.dart';
import 'package:netflix_app_api/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final widgetList = [
    const SmartDownloads(),
    kHeight10,
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: WidgetAppBar(
              title: 'Downloads',
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => widgetList[index],
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: widgetList.length,
        ));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    ApiFunctions.comingSoon[0].posterPath,
    ApiFunctions.nowPlaying[0].posterPath,
    ApiFunctions.topRated[0].posterPath
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Introducing Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight10,
        Text(
          "We'll download a personalized selection of\n movies and shows for you, so there's\n always something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        kHeight10,
        Container(
          color: Colors.black,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.40,
                backgroundColor: Colors.grey.shade700,
              ),
              DownloadImagesWidget(
                size: Size(size.width * 0.38, size.height * 0.30),
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 200),
                angle: 20,
              ),
              DownloadImagesWidget(
                size: Size(size.width * 0.38, size.height * 0.30),
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 200),
                angle: -20,
              ),
              DownloadImagesWidget(
                size: Size(size.width * 0.40, size.height * 0.32),
                imageList: imageList[2],
                margin: const EdgeInsets.only(top: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade700),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Set Up',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'See What You Can Download',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class DownloadImagesWidget extends StatelessWidget {
  const DownloadImagesWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: kRadius10,
            color: Colors.black,
            image: DecorationImage(
                image:
                    NetworkImage('https://image.tmdb.org/t/p/w500$imageList'),
                fit: BoxFit.cover)),
        width: size.width,
        height: size.height,
      ),
    );
  }
}
