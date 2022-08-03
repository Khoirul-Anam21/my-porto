import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NavBarLarge(),
        Expanded(
          flex: 8,
          child: Row(
            children: const [
              Expanded(child: IntroTitle()),
              Expanded(child: IntroImage()),
            ],
          ),
        ),
      ],
    );
  }
}

