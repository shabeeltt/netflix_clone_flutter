import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("search Page")),
      ),
      body: Center(
        child: Text("This is the netflix Home page"),
      ),
    );
  }
}
