import 'package:flutter/material.dart';
import 'package:netflix_app_api/core/constants.dart';
import 'package:netflix_app_api/domain/functions.dart';
import 'package:netflix_app_api/presentation/new_hot/widgets/coming_soon.dart';
import 'package:netflix_app_api/presentation/new_hot/widgets/everyone_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 27,
                ),
                kwidth,
                Container(
                  height: 27,
                  width: 27,
                  color: Colors.blue,
                ),
                kwidth,
              ],
              bottom: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  isScrollable: true,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  tabs: [
                    Tab(
                      text: '🍿 Coming soon',
                    ),
                    Tab(
                      text: '👀 Everyone Watching',
                    )
                  ]),
            ),
          ),
          body: TabBarView(
              children: [buildComingSoon(), buildEveryoneWatching()])),
    );
  }

  Widget buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Column(
        children: [
          kHeight10,
          ComingSoonWidget(
            movie: ApiFunctions.comingSoon[index],
          )
        ],
      ),
    );
  }

  Widget buildEveryoneWatching() {
    return ListView.builder(
      itemBuilder: (context, index) => EveryoneWatching(
        movie: ApiFunctions.discover[index],
      ),
      itemCount: 10,
    );
  }
}
