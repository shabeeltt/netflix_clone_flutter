import 'package:flutter/material.dart';

class HotNewsScreen extends StatelessWidget {
  const HotNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(child: Text("hot news Page")),
      ),
      body: Center(
        child: Text("This is the netflix Home page"),
      ),
    );
  }
}
