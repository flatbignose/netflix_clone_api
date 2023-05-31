import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app_api/domain/functions.dart';
import 'package:netflix_app_api/presentation/main_page/screen_main.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    splashEnd(context);
    return Center(
      child: Text(
        'NETFLIX',
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  Future<void> splashEnd(BuildContext context) async {
    await ApiFunctions.getComingSoon();
    await ApiFunctions.getDiscover();
    await ApiFunctions.getTopRated();
    await ApiFunctions.getTrending();
    ApiFunctions.getNowPlaying().whenComplete(() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenMain(),
        )));
  }
}
