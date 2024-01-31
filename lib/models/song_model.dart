import 'dart:convert';
import 'package:http/http.dart' as http;

class Song {
  final List<Result> results;

  Song({
    required this.results,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );
  }

  static fetchSongs() async {
    const String apiUrl =
        'https://itunes.apple.com/search?term=ed+sheeran&entity=song&limit=30';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        Song songs = Song.fromJson(json);
        return songs;
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

class Result {
  final int artistId;
  final int trackId;
  final String artistName;
  final String trackName;
  final String previewUrl;
  final String artworkUrl100;
  final int trackTimeMillis;

  Result(
      {required this.artistId,
      required this.trackId,
      required this.artistName,
      required this.trackName,
      required this.previewUrl,
      required this.artworkUrl100,
      required this.trackTimeMillis});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      artistId: json["artistId"],
      trackId: json["trackId"],
      artistName: json["artistName"],
      trackName: json["trackName"],
      previewUrl: json["previewUrl"],
      artworkUrl100: json["artworkUrl100"],
      trackTimeMillis: json["trackTimeMillis"],
    );
  }
}
