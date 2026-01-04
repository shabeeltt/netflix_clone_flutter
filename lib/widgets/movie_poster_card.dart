import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/common/utils.dart';
import 'package:netflix_clone_flutter/model/now_playing_movies.model.dart';
import 'package:shimmer/shimmer.dart';

class MoviePosterCard extends StatelessWidget {
  final Movie movie;

  const MoviePosterCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final posterUrl = "$baseImageUrl${movie.posterPath}";

    return GestureDetector(
        onTap: () {
          debugPrint("Tapped: ${movie.title}");
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background
                Container(color: Colors.grey.shade800),

                // Poster image
                Image.network(
                  posterUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _imageShimmer();
                  },
                  errorBuilder: (_, __, ___) {
                    return const Center(
                      child: Icon(Icons.error, color: Colors.white),
                    );
                  },
                ),

                // Bottom gradient overlay
                _bottomGradient(),

                // Bottom buttons
                _bottomActions(),
              ],
            ),
          ),
        ));
  }

  // -------------------- UI PARTS --------------------

  Widget _bottomGradient() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black87,
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomActions() {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _playButton()),
              const SizedBox(width: 12),
              Expanded(child: _myListButton()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _playButton() {
    return ElevatedButton.icon(
      onPressed: () {
        debugPrint("Play: ${movie.title}");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: const Icon(Icons.play_arrow, size: 20, color: Colors.black),
      label: const Text(
        'Play',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _myListButton() {
    return ElevatedButton.icon(
      onPressed: () {
        debugPrint("My List: ${movie.title}");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white30),
        ),
      ),
      icon: const Icon(Icons.add, size: 20, color: Colors.white),
      label: const Text(
        'My List',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _imageShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(color: Colors.grey.shade800),
    );
  }
}
