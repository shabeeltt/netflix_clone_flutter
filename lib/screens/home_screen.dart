import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/services/api_services.dart';
import 'package:netflix_clone_flutter/model/now_playing_movies.model.dart';
import 'package:netflix_clone_flutter/widgets/now_playing_carousel.dart';
import 'package:netflix_clone_flutter/widgets/trending_movies.dart';
import 'package:netflix_clone_flutter/widgets/upcoming_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices _apiServices = ApiServices();
  late Future<NowPlayingMovies?> _movieData;

  @override
  void initState() {
    super.initState();
    _movieData = _apiServices.fetchNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 50),
          _buildTopBar(),

          // 👇 Everything below can scroll
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildFilters(),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 480,
                    child: NowPlayingCarousel(future: _movieData),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Trending Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: TrendingMoviesWidget(),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Upcoming Movies",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: UpcomingMoviesWidget(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------- UI PARTS --------------------

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Image.asset(
            "assets/netflix_logo.png",
            height: 50,
          ),
          const Spacer(),
          _iconButton(Icons.search),
          _iconButton(Icons.favorite),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _filterButton(
            text: "TV Shows",
            icon: Icons.tv,
          ),
          const SizedBox(width: 8),
          _filterButton(
            text: "Categories",
            icon: Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }

  // -------------------- SMALL HELPERS --------------------

  Widget _iconButton(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: Colors.white,
    );
  }

  Widget _filterButton({
    required String text,
    required IconData icon,
  }) {
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.white38),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          Icon(icon, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}
