import 'dart:convert';

NowPlayingMovies nowPlayingMoviesFromJson(String str) =>
    NowPlayingMovies.fromJson(json.decode(str));

String nowPlayingMoviesToJson(NowPlayingMovies data) =>
    json.encode(data.toJson());

class NowPlayingMovies {
  List<Movie> movies;

  NowPlayingMovies({
    required this.movies,
  });

  factory NowPlayingMovies.fromJson(Map<String, dynamic> json) =>
      NowPlayingMovies(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
      };
}

class Movie {
  int id;
  String title;
  String overview;
  String posterPath;
  DateTime releaseDate;
  double popularity;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.popularity,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        popularity: json["popularity"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "popularity": popularity,
      };
}
