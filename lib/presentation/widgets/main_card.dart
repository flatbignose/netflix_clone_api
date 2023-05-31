import 'package:flutter/material.dart';
import 'package:netflix_app_api/core/constants.dart';

class MainHomeCard extends StatelessWidget {
  const MainHomeCard({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: size.width * 0.30,
        decoration: BoxDecoration(
            borderRadius: kRadius10,
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageUrl))),
      ),
    );
  }
}
