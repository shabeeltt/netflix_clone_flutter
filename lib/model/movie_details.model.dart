import 'dart:convert';

MovieDetails movieDetailsFromJson(String str) =>
    MovieDetails.fromJson(json.decode(str));

String movieDetailsToJson(MovieDetails data) => json.encode(data.toJson());

class MovieDetails {
  Movie movie;

  MovieDetails({
    required this.movie,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        movie: Movie.fromJson(json["movie"]),
      );

  Map<String, dynamic> toJson() => {
        "movie": movie.toJson(),
      };
}

class Movie {
  int id;
  String title;
  String overview;
  String posterPath;
  String backdropPath;
  double popularity;
  double voteAverage;
  DateTime releaseDate;
  int runtime;
  List<Genre> genres;
  String homepage;
  String status;
  String tagline;
  List<ProductionCompany> productionCompanies;
  List<SpokenLanguage> spokenLanguages;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.popularity,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
    required this.homepage,
    required this.status,
    required this.tagline,
    required this.productionCompanies,
    required this.spokenLanguages,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        popularity: json["popularity"]?.toDouble(),
        voteAverage: json["vote_average"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        runtime: json["runtime"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        status: json["status"],
        tagline: json["tagline"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompany.fromJson(x))),
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "popularity": popularity,
        "vote_average": voteAverage,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "runtime": runtime,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "status": status,
        "tagline": tagline,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
      };
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompany {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
