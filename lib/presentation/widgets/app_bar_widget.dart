// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetAppBar extends StatelessWidget {
  final String title;
  const WidgetAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://wallpapers.com/images/high/netflix-profile-pictures-1000-x-1000-vnl1thqrh02x7ra2.webp'))),
              )
            ],
          )
        ],
      ),
    );
  }
}
