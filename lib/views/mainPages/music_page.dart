import 'package:flutter/material.dart';
import 'package:music_app/controllers/main_prov.dart';
import 'package:music_app/views/mainPages/glass_container.dart';
import 'package:music_app/views/mainPages/music_page_content.dart';
import 'package:provider/provider.dart';
import 'package:siri_wave/siri_wave.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final mainProv = Provider.of<MainProv>(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Image.asset("assets/icons/arrow_back.png"),
            onPressed: () {
              mainProv.changePauseFlag();
              Navigator.pop(context);
            },
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60), //TODO
            child: Text(
              "Now PLAYING",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
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
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_image.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const GlassContainer(),
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 100,
                    child: SiriWaveform.ios7(
                      controller: mainProv.siriController1,
                      options: const IOS7SiriWaveformOptions(
                        height: 180,
                        width: 360,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: SiriWaveform.ios7(
                      controller: mainProv.siriController2,
                      options: const IOS7SiriWaveformOptions(
                        height: 180,
                        width: 360,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 100,
              child: MusicPageContent(),
            ),
          ],
        ),
      ),
    );
  }
}

