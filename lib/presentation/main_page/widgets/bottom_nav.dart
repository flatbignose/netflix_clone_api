import 'package:flutter/material.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class WidgetBottomNav extends StatelessWidget {
  const WidgetBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) => indexNotifier.value = index,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv_rounded), label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions_outlined),
                  label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download_for_offline_outlined),
                  label: 'Downloads'),
            ]);
      },
    );
  }
}
