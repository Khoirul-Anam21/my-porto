import 'package:flutter/material.dart';

class IntroTitle extends StatelessWidget {
  const IntroTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Ini Judul woi',
            style: Theme.of(context).textTheme.headline3,
          ),
          const Text('Nah ini subjudul'),
        ],
      ),
    );
  }
}
