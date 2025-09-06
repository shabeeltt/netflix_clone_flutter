import 'package:flutter/material.dart';

class HotNewsScreen extends StatelessWidget {
  const HotNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("hot news Page")),
      ),
      body: Center(
        child: Text("This is the netflix Home page"),
      ),
    );
  }
}
