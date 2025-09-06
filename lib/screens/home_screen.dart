import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/netflix_logo.png",
                    height: 50,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: const Color.fromARGB(255, 241, 241, 241),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.download),
                    color: const Color.fromARGB(255, 241, 241, 241),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.cast),
                    color: const Color.fromARGB(255, 241, 241, 241),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
