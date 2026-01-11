import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/model/movie_details.model.dart';
import 'package:netflix_clone_flutter/services/api_services.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<MovieDetails?> _movieDetails;
  final ApiServices _apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    _movieDetails = _apiServices.fetchMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Movie Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<MovieDetails?>(
        future: _movieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }

          if (snapshot.hasError || snapshot.data == null) {
            return const Center(
              child: Text(
                "Failed to load movie details",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final movie = snapshot.data!.movie;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Poster
                if (movie.posterPath.isNotEmpty)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                        width: 200,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),

                // Title
                Text(
                  movie.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Tagline
                if (movie.tagline.isNotEmpty)
                  Text(
                    movie.tagline,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                const SizedBox(height: 12),

                // Overview
                Text(
                  movie.overview,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 16),

                // Info Row (Release date, Runtime, Rating)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Release: ${movie.releaseDate.toLocal().toIso8601String().split('T')[0]}",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Text(
                      "Runtime: ${movie.runtime} min",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Text(
                      "Rating: ${movie.voteAverage}/10",
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Genres
                if (movie.genres.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    children: movie.genres
                        .map((g) => Chip(
                              label: Text(g.name),
                              backgroundColor: Colors.red.shade800,
                              labelStyle: const TextStyle(color: Colors.white),
                            ))
                        .toList(),
                  ),
                const SizedBox(height: 16),

                // Production companies
                if (movie.productionCompanies.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Production Companies:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ...movie.productionCompanies.map((c) => Text(
                            c.name,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                          )),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
