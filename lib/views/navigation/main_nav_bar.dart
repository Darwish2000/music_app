import 'package:flutter/material.dart';
import 'package:music_app/controllers/main_prov.dart';
import 'package:music_app/controllers/navigation_prov.dart';
import 'package:music_app/views/mainPages/played_music_card.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigationProv = Provider.of<NavigationProv>(context);
    var mainProv = Provider.of<MainProv>(context);
    double indicatorWidth = MediaQuery.of(context).size.width / 5;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: const Color(0xFF212A32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mainProv.selectedSong != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PlayedMusicCard(selectedSong: mainProv.selectedSong!),
                ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Image.asset("assets/icons/home_icon.png"),
                    onPressed: () => navigationProv.changePage(0),
                  ),
                  IconButton(
                    icon: Image.asset("assets/icons/search_icon.png"),
                    onPressed: () => navigationProv.changePage(1),
                  ),
                  const SizedBox(
                    width: 45,
                    height: 45,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFf75191),
                      radius: 45,
                      child: Icon(
                        Icons.headphones,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset("assets/icons/flow_icon.png"),
                    onPressed: () => navigationProv.changePage(3),
                  ),
                  IconButton(
                    icon: Image.asset("assets/icons/settings_icon.png"),
                    onPressed: () => navigationProv.changePage(4),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                width: indicatorWidth,
                alignment: Alignment.center,
                height: 3,
                curve: Curves.easeInOutCirc,
                margin: EdgeInsets.only(
                    left: indicatorWidth * (navigationProv.currentTab),
                    bottom: 10),
                child: Container(
                  color: const Color(0xFFF75191),
                  width: indicatorWidth / 5,
                ),
              )
            ],
          ),
        ),
        body: PageView(
          controller: navigationProv.pageController,
          children: navigationProv.pages,
        ),
      ),
    );
  }
}
