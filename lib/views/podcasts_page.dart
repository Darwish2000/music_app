import 'package:flutter/material.dart';

class PodcastsPage extends StatelessWidget {
  const PodcastsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Podcasts..",style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}