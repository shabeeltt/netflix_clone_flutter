import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/common/utils.dart';
import 'package:netflix_clone_flutter/model/now_playing_movies.model.dart';
import 'package:netflix_clone_flutter/services/api_services.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<NowPlayingMovies?> movieData;

  @override
  void initState() {
    super.initState();
    movieData = apiServices.fetchNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          // Top App Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset(
                  "assets/netflix_logo.png",
                  height: 50,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cast),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // Filter Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.white38),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        "Tv Shows",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.tv,
                        color: Colors.white,
                        size: 17,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.white38),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        "Categories",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Movie Carousel
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: SizedBox(
              height: 480,
              child: FutureBuilder<NowPlayingMovies?>(
                future: movieData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Shimmer placeholder while loading
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
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (!snapshot.hasData ||
                      snapshot.data!.movies.isEmpty) {
                    return const Center(
                      child: Text(
                        "No movies found",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    final movies = snapshot.data!.movies;

                    return PageView.builder(
                      controller: PageController(viewportFraction: 0.8),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        final posterUrl = "$baseImageUrl${movie.posterPath}";

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              //navigate to specific movie page
                              print("Tapped: ${movie.title}");
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Container(
                                    color: Colors.grey.shade800,
                                  ),
                                  Image.network(
                                    posterUrl,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey.shade800,
                                        highlightColor: Colors.grey.shade700,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                          ),
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey,
                                        child: const Icon(Icons.error,
                                            color: Colors.white),
                                      );
                                    },
                                  ),
                                  Text(
                                    'testing',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
