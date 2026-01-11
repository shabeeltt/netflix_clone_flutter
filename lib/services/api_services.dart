import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_flutter/model/movie_details.model.dart';
import 'package:netflix_clone_flutter/model/now_playing_movies.model.dart';
import 'package:netflix_clone_flutter/common/utils.dart';
import 'package:netflix_clone_flutter/model/trending_movies.model.dart';
import 'package:netflix_clone_flutter/model/upcoming_movies.model.dart';
import 'package:flutter/foundation.dart';

class ApiServices {
  // fetch now playing movies
  Future<NowPlayingMovies?> fetchNowPlayingMovies() async {
    try {
      const endPoint = "/movies/now-playing";
      final url = "$baseUrlDev$endPoint";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decode JSON and map to your model
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return NowPlayingMovies.fromJson(jsonData);
      } else {
        throw Exception(
            "Error fetching movies: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Error fetching movies: $e");
      return null;
    }
  }

//fetch upcoming movies
  Future<UpcomingMovies?> fetchUpcomingMovies() async {
    try {
      const endPoint = "/movies/upcoming";
      final url = "$baseUrlDev$endPoint";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        return UpcomingMovies.fromJson({'movies': jsonData['upcomingMovies']});
      } else {
        throw Exception(
            "Error fetching upcoming movies: ${response.statusCode} ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Error fetching upcoming movies: $e");
      return null;
    }
  }

//fetch trending movies
  Future<TrendingMovies?> fetchTrendingMovies(
      {String timeWindow = "day"}) async {
    try {
      final url = Uri.parse(
        '$baseUrlDev/movies/trending?timeWindow=$timeWindow',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        return TrendingMovies.fromJson({
          'movies': jsonData['trendingMovies'],
        });
      } else {
        throw Exception('Failed to load trending movies');
      }
    } catch (e) {
      debugPrint('Trending movies error: $e');
      return null;
    }
  }

  // Fetch single movie details by ID
  Future<MovieDetails?> fetchMovieDetails(int movieId) async {
    try {
      final url = Uri.parse('$baseUrlDev/movies/$movieId');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        // Map JSON to your MovieDetails model
        return MovieDetails.fromJson(jsonData);
      } else {
        throw Exception(
            'Error fetching movie details: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint('Error fetching movie details: $e');
      return null;
    }
  }
}
