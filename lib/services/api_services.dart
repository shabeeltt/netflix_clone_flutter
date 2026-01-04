import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_flutter/model/now_playing_movies.model.dart';
import 'package:netflix_clone_flutter/common/utils.dart';

class ApiServices {
  // fetch now playing movies
  Future<NowPlayingMovies?> fetchNowPlayingMovies() async {
    try {
      const endPoint = "/api/movies/now-playing";
      final url = "$baseUrlDev$endPoint";

      print("about to call the api");
      final response = await http.get(Uri.parse(url));

      print("got the api resposne");

      if (response.statusCode == 200) {
        // Decode JSON and map to your model
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return NowPlayingMovies.fromJson(jsonData);
      } else {
        throw Exception(
            "Error fetching movies: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error fetching movies: $e");
      return null;
    }
  }
}
