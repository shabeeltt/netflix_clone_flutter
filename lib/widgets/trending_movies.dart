import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/common/utils.dart';
import 'package:netflix_clone_flutter/model/trending_movies.model.dart';
import 'package:netflix_clone_flutter/services/api_services.dart';

class TrendingMoviesWidget extends StatefulWidget {
  const TrendingMoviesWidget({super.key});

  @override
  State<TrendingMoviesWidget> createState() => _TrendingMoviesWidgetState();
}

class _TrendingMoviesWidgetState extends State<TrendingMoviesWidget> {
  final ApiServices _apiServices = ApiServices();
  late Future<TrendingMovies?> _trendingMovies;

  @override
  void initState() {
    super.initState();
    _trendingMovies = _apiServices.fetchTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TrendingMovies?>(
      future: _trendingMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.red));
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: Text(
              "Failed to load trending movies",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final movies = snapshot.data!.movies;

        if (movies.isEmpty) {
          return const Center(
            child: Text(
              "No trending movies",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];

            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 15 : 8,
                right: 8,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "$baseImageUrl/${movie.posterPath}",
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: 120,
                      height: 180,
                      color: Colors.grey[900],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white54,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
