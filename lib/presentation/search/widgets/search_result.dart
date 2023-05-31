import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix_app_api/core/constants.dart';
import 'package:netflix_app_api/presentation/search/widgets/search_title.dart';

import '../../../domain/functions.dart';

final List imageList = [
  'https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/vNVFt6dtcqnI7hqa6LFBUibuFiw.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/34m2tygAYBGqA9MXKhRDtzYd4MR.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/AcrDB32TqpAGwvQFbICALGxSzn3.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/peNC0eyc3TQJa6x4TdKcBPNP4t0.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/gmTOhwzcSbEGG3xKRfQwwS2BTXD.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/jKonm6Q3vw51Ytd4y7bJ70xJT7l.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/dBxxtfhC4vYrxB2fLsSxOTY2dQc.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/liLN69YgoovHVgmlHJ876PKi5Yi.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/cfcmyPUJbynbUtKIlqSdkOrgyzU.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/j4uI3VfubinCGzatlZcRcjrLyZ1.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/daSFbrt8QCXV2hSwB0hqYjbj681.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/vnRthEZz16Q9VWcP5homkHxyHoy.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/3kmfoWWEc9Vtyuaf9v5VipRgdjx.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/ieyUpr5ES9QEz1cn4clCnBf9XJl.jpg',
];

class WidgetSearchResult extends StatelessWidget {
  const WidgetSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Movies & TV'),
        kHeight10,
        ValueListenableBuilder(
          valueListenable: SearchFunction.searchData,
          builder: (context, value, child) {
            return Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 1.4,
                children: List.generate(
                    value.length,
                    (index) => MainCard(
                          image: value[index].posterPath ??
                              'https://www.themoviedb.org/t/p/w440_and_h660_face/rM5Y0ziZbmpkqW1db2HK3xrzTXj.jpg',
                        )),
              ),
            );
          },
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w500$image'),
              fit: BoxFit.cover)),
    );
  }
}
