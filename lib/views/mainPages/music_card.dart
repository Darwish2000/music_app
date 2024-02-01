import 'package:flutter/material.dart';
import 'package:music_app/controllers/main_prov.dart';
import 'package:music_app/models/song_model.dart';
import 'package:provider/provider.dart';

class MusicCard extends StatelessWidget {
  Result result;
  int index;

  MusicCard({super.key, required this.result, required this.index});

  @override
  Widget build(BuildContext context) {
    var mainProv = Provider.of<MainProv>(context);
    return InkWell(
      onTap: () {
        mainProv.setTrack(result.previewUrl, index, result);
      },
      child: Container(
          decoration: BoxDecoration(
              color: mainProv.selectedCardIndex != index
                  ? const Color(0xFF212A32)
                  : Colors.white12,
              borderRadius: BorderRadius.circular(11)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
            child: Row(
              children: [
                Container(
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: mainProv.selectedCardIndex != index
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFFF75191),
                  ),
                  child: Center(
                    child: mainProv.selectedCardIndex != index
                        ? Image.asset(
                            'assets/icons/play.png',
                          )
                        : SizedBox(
                            width: 11,
                            height: 13,
                            child: Image.asset(
                              'assets/icons/pause.png',
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainProv.removeBracketsAndContents(result.trackName),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      result.artistName,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  mainProv.formatMilliseconds(result.trackTimeMillis),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )),
    );
  }
}
