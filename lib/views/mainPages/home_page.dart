import 'package:flutter/material.dart';
import 'package:music_app/controllers/main_prov.dart';
import 'package:music_app/views/mainPages/music_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MainProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All SONGS",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.51),
            child: Image.asset(
              'assets/icons/search.png',
            ),
          )
        ],
      ),
      body: !prov.pageIsLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                itemCount: prov.songs!.results.length,
                itemBuilder: (context, index) => (MusicCard(result: prov.songs!.results[index],index: index,)),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFF75191),
              ),
            ),
    );
  }
}
