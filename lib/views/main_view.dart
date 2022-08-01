import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(flex: 1, child: SideNav()),
        Expanded(flex: 4, child: IntroTitle()),
        Expanded(flex: 4, child: IntroImage()),
      ],
    );
  }
}