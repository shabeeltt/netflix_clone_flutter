import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/screens/home_screen.dart';
import 'package:netflix_clone_flutter/screens/hot_news_screen.dart';
import 'package:netflix_clone_flutter/screens/search_screen.dart';

class AppNavbarScreen extends StatelessWidget {
  const AppNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.black,
          bottomNavigationBar: Container(
            color: Colors.black,
            height: 70,
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.search),
                  text: "Search",
                ),
                Tab(
                  icon: Icon(Icons.photo_library_outlined),
                  text: "Hot News",
                ),
              ],
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(
              children: [HomeScreen(), SearchScreen(), HotNewsScreen()]),
        ));
  }
}
