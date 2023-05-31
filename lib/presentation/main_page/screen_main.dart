import 'package:flutter/material.dart';
import 'package:netflix_app_api/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_app_api/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix_app_api/presentation/home/home.dart';

import 'package:netflix_app_api/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_app_api/presentation/new_hot/new_hot.dart';
import 'package:netflix_app_api/presentation/search/search.dart';
import 'package:netflix_app_api/presentation/search/widgets/search_idle.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    const ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const WidgetBottomNav(),
    );
  }
}
