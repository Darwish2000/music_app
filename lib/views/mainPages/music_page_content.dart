import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/controllers/main_prov.dart';
import 'package:music_app/views/widgtes/custom_button.dart';
import 'package:provider/provider.dart';

class MusicPageContent extends StatelessWidget {
  const MusicPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mainProv = Provider.of<MainProv>(context,listen: true);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.network(
              mainProv.selectedSong!.artworkUrl100,
              fit: BoxFit.cover,
              width: 240,
              height: 240,
            ),
          ),
        ]),
        const SizedBox(
          height: 45,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
                icon: "assets/icons/favorite_icon.png",
                text: "FOLLOW",
                color: Colors.transparent),
            const SizedBox(
              width: 12,
            ),
            CustomButton(
              icon: "assets/icons/shuffle.png",
              text: "SHUFFLE PLAY",
              color: const Color(0xFFF75191),
              isShuffle: true,
            )
          ],
        ),
        const SizedBox(
          height: 45,
        ),
        Text(mainProv.removeBracketsAndContents(mainProv.selectedSong!.trackName),
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: 10,
        ),
        Text(mainProv.selectedSong!.artistName,
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(
          height: 50,
        ),
        StreamBuilder<Duration>(
          stream: mainProv.audioPlayer!.positionStream,
          builder:(context, snapshot) => SizedBox(
            width: 355,
            child: ProgressBar(
              thumbColor: Colors.white,
              thumbRadius: 6,
              thumbGlowRadius: 12,
              timeLabelTextStyle: Theme.of(context).textTheme.bodySmall,
              timeLabelLocation: TimeLabelLocation.sides,
              progressBarColor: const Color(0xFFF75191),
              barHeight: 3,
              progress:snapshot.data ?? const Duration(),
              total: Duration(milliseconds: mainProv.selectedSong!.trackTimeMillis),
              baseBarColor: const Color(0xFF909194),
            ),
          ) ,

        ),
        const SizedBox(
          height: 75,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/icons/skip_backward.png"),
            const SizedBox(
              width: 24,
            ),
            Image.asset("assets/icons/rewind.png"),
            const SizedBox(
              width: 24,
            ),
             SizedBox(
              width: 72.26,
              height: 72.26,
              child: CircleAvatar(
                backgroundColor:const Color(0xFFFFFFFF),
                radius: 20,
                child: (mainProv.audioPlayer?.playing ?? false )? GestureDetector(
                  onTap: () {
                    mainProv.pauseAudio(mainProv.selectedSong!.previewUrl, mainProv.selectedCardIndex!);

                  },
                  child: Image.asset(
                    "assets/icons/pause.png",
                    color: const Color(0xFF212A32),
                  ),
                ) : GestureDetector(
                  onTap: () {
                    mainProv.playAudio(mainProv.selectedSong!.previewUrl, mainProv.selectedCardIndex!,mainProv.selectedSong!);

                  },
                  child: Image.asset(
                    "assets/icons/play_2.png",
                    color: const Color(0xFF212A32),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Image.asset("assets/icons/fast_forward.png"),
            const SizedBox(
              width: 24,
            ),
            Image.asset("assets/icons/skip_forward.png"),
          ],
        )
      ],
    );
  }
}
