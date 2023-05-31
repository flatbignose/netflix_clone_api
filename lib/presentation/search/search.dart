import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_api/core/constants.dart';
import 'package:netflix_app_api/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app_api/presentation/search/widgets/search_result.dart';

import '../../domain/functions.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onChanged: (value) async {
                SearchFunction.searchResult(value);
              },
              //dbouncer use for search
              backgroundColor: Colors.grey.withOpacity(0.4),
              style: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
            ),
            kHeight10,
            // Expanded(child: WidgetSearchIdle(title: 'Top Searches'))
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: SearchFunction.searchData,
              builder: (context, value, child) {
                return value.isEmpty
                    ?   WidgetSearchIdle(
                        title: 'Top Searches',
                      )
                    : const WidgetSearchResult();
              },
            ))
          ],
        ),
      ),
    ));
  }
}
