import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/common/utils.dart';

class MoviePosterTile extends StatelessWidget {
  final String posterPath;
  final VoidCallback onTap;
  final double width;
  final double height;

  const MoviePosterTile({
    super.key,
    required this.posterPath,
    required this.onTap,
    this.width = 120,
    this.height = 180,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          "$baseImageUrl/$posterPath",
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              width: width,
              height: height,
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
  }
}
