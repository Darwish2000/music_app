import 'package:flutter/cupertino.dart';
import 'package:music_app/views/mainPages/home_page.dart';
import 'package:music_app/views/podcasts_page.dart';
import 'package:music_app/views/search_page.dart';
import 'package:music_app/views/settings_page.dart';

class NavigationProv with ChangeNotifier {
  int currentTab = 0;
  PageController pageController=PageController(initialPage: 0,keepPage: true);
  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    const PodcastsPage(),
    const SettingsPage()
  ];
  void changePage(int index) {
    currentTab = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
}
