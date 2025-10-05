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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white38)),
                    child: Row(
                      children: [
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
                  SizedBox(
                    width: 8,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white38)),
                    child: Row(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 1),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade800)),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
