import 'package:flutter/material.dart';
import 'package:netflix_app_api/presentation/fast_laugh/widgets/video_list.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
            10,
            (index) => WidgetVideoList(
                  index: index,
                )),
      ),
    ));
  }
}
