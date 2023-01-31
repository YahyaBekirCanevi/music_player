import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Placeholder(
          color: Colors.red,
          child: Center(child: Text('Say Helloooo')),
        ),
      ),
    );
  }
}
