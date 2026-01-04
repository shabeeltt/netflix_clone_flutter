class TrendingMovies {
  final List<Movie> movies;

  TrendingMovies({required this.movies});

  factory TrendingMovies.fromJson(Map<String, dynamic> json) {
    return TrendingMovies(
      movies: List<Movie>.from(
        json['movies'].map((x) => Movie.fromJson(x)),
      ),
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double popularity;
  final double voteAverage;
  final DateTime releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.popularity,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: DateTime.parse(json['release_date']),
    );
  }
}
