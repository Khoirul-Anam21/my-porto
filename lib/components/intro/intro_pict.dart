import 'package:flutter/material.dart';

class IntroImage extends StatelessWidget {
  const IntroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FlutterLogo(size: 90, style: FlutterLogoStyle.stacked,);
  }
}