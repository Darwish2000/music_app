import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/controllers/main_prov.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/views/mainPages/music_page.dart';
import 'package:provider/provider.dart';

class PlayedMusicCard extends StatelessWidget {
  final Result selectedSong;

  const PlayedMusicCard({super.key, required this.selectedSong});

  @override
  Widget build(BuildContext context) {
    var mainProv = Provider.of<MainProv>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MusicPage()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 28,
            sigmaY: 28,
          ),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.network(
                    selectedSong.artworkUrl100,
                    width: 42.0,
                    height: 42.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    mainProv.removeBracketsAndContents(selectedSong.trackName),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const Spacer(),
                  Image.asset("assets/icons/pause.png"),
                  const SizedBox(width: 20),
                  Image.asset("assets/icons/next.png"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

