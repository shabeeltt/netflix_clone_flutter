import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/common/utils.dart';
import '../model/upcoming_movies.model.dart';
import '../services/api_services.dart';

class UpcomingMoviesWidget extends StatefulWidget {
  const UpcomingMoviesWidget({super.key});

  @override
  State<UpcomingMoviesWidget> createState() => _UpcomingMoviesWidgetState();
}

class _UpcomingMoviesWidgetState extends State<UpcomingMoviesWidget> {
  final ApiServices _apiServices = ApiServices();
  late Future<UpcomingMovies?> _upcomingMovies;

  @override
  void initState() {
    super.initState();
    _upcomingMovies = _apiServices.fetchUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UpcomingMovies?>(
      future: _upcomingMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.movies.isEmpty) {
          return const Center(
            child: Text(
              "No upcoming movies",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final movies = snapshot.data!.movies;

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 15 : 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "$baseImageUrl/${movie.posterPath}",
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 180,
                      color: Colors.grey[800],
                      child:
                          const Icon(Icons.broken_image, color: Colors.white),
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
