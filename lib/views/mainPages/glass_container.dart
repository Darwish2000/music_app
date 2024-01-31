import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 246,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            const Color(0xFF161A1A),
            const Color(0xFFE4E8EB).withOpacity(0),
            // Use the correct opacity for your needs
          ])),
    );
  }
}
