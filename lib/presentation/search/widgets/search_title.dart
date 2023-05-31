import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
