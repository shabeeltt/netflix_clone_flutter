import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/model/now_playing_movies.model.dart';
import 'package:netflix_clone_flutter/widgets/movie_poster_card.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingCarousel extends StatelessWidget {
  final Future<NowPlayingMovies?> future;

  const NowPlayingCarousel({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NowPlayingMovies?>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmer();
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.movies.isEmpty) {
          return const Center(
            child: Text(
              'No movies found',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final movies = snapshot.data!.movies;

        return PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: MoviePosterCard(movie: movies[index]),
            );
          },
        );
      },
    );
  }

  Widget _buildShimmer() {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.9),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade700,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        );
      },
    );
  }
}
