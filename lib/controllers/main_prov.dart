import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/song_model.dart';
import 'package:siri_wave/siri_wave.dart';

class MainProv with ChangeNotifier {
  Song? songs;
  bool pageIsLoading = true;
  int? selectedCardIndex = -1;
  Result? selectedSong;
  AudioPlayer? audioPlayer;

  IOS7SiriWaveformController siriController1 = IOS7SiriWaveformController(
    amplitude: 0.5,
    color: Colors.grey,
    frequency: 7,
    speed: 0.12,
  );
  IOS7SiriWaveformController siriController2 = IOS7SiriWaveformController(
    amplitude: 0.5,
    color: Colors.grey,
    frequency: 7,
    speed: 0.12,
  );

  MainProv() {
    fetchSongs();
    audioPlayer = AudioPlayer();
  }

  /*
  json type
  {
  results:
      [
      "artistId": ******,
      "trackId": ******,
      "artistName" ******,
      "trackName": ******,
      "previewUrl": ******,
      "artworkUrl100": ******
      ]
  } -->>
  */

  fetchSongs() async {
    songs = await Song.fetchSongs();
    pageIsLoading = false;
    notifyListeners();
  }

  Future<void> setTrack(String audioUrl, int cardIndex, Result song,
      {bool autoPlay = true}) async {
    await audioPlayer?.setUrl(audioUrl);

    if (autoPlay) {
      playAudio(audioUrl, cardIndex, song);
    }
  }

  Future<void> playAudio(String audioUrl, int cardIndex, Result song) async {
    audioPlayer?.play();
    siriController2.speed = siriController1.speed = 0.12;

    selectedCardIndex = cardIndex;
    selectedSong = song;
    notifyListeners();
  }

  Future<void> pauseAudio(String audioUrl, int cardIndex) async {
    await audioPlayer?.pause();
    siriController2.speed = siriController1.speed = 0;

    notifyListeners();
  }

  // int (34324 milliseconds) from api --> string (minutes : seconds)
  String formatMilliseconds(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int remainingSeconds = seconds % 60;

    String formattedTime =
        '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  // Old School Love (feat. Ed Sheeran) from api to --> Old School Love
  String removeBracketsAndContents(String input) {
    RegExp exp = RegExp(r'\([^)]*\)|\[[^\]]*\]');
    return input.replaceAll(exp, '').trim();
  }
}
