import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoButton extends StatelessWidget {
  const RepoButton({
    Key? key,
    required this.color,
    required this.svgImg,
    required this.urlDest
  }) : super(key: key);

  final Color color;
  final String svgImg;
  final String urlDest;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(urlDest);
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(url)) {
          throw Exception("INVALID URL");
        }
      },
      child: SvgPicture.asset(
        svgImg,
        color: color,
        width: 30,
        height: 30,
      ),
    );
  }
}