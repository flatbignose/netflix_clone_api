import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:netflix_app_api/core/api_strings.dart';
import 'package:netflix_app_api/infrastructure/movie/movie.dart';
import 'package:http/http.dart' as http;

import '../infrastructure/pages/pages.dart';

class ApiFunctions {
  static List<Movie> nowPlaying = [];
  static List<Movie> trending = [];
  static List<Movie> comingSoon = [];
  static List<Movie> topRated = [];
  static List<Movie> discover = [];

  static String mainImage = '';

  static Future<void> getNowPlaying() async {
    try {
      final response = await http.get(Uri.parse(nowPlayingUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        mainImage = pages.results![6].posterPath!;
        nowPlaying.addAll(pages.results!);
      }
    } catch (e) {
      stdout.write(e);
    }
  }

  static Future<void> getTrending() async {
    try {
      final response = await http.get(Uri.parse(trendingUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        trending.addAll(pages.results!);
      }
    } catch (e) {
      stdout.write(e);
    }
  }

  static Future<void> getComingSoon() async {
    try {
      final response = await http.get(Uri.parse(comingSoonUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        comingSoon.addAll(pages.results!);
      }
    } catch (e) {
      stdout.write(e);
    }
  }

  static Future<void> getTopRated() async {
    try {
      final response = await http.get(Uri.parse(discoveUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        discover.addAll(pages.results!);
      }
    } catch (e) {
      stdout.write(e);
    }
  }

  static Future<void> getDiscover() async {
    try {
      final response = await http.get(Uri.parse(topRatedUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        topRated.addAll(pages.results!);
      }
    } catch (e) {
      stdout.write(e);
    }
  }
}

class SearchFunction {
  static ValueNotifier<List<Movie>>   searchData = ValueNotifier([]);
  static Future<void> searchResult(String quary) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=b43cdebbf28b141d29f7bc335fe94fe2&query=$quary'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        searchData.value.clear();
        searchData.value.addAll(pages.results!);
        searchData.notifyListeners();
      }
    } catch (e) {
      stdout.write(e);
    }
  }
}
