import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 0, bottom: 16.0),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text('Opsi satu'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 0, bottom: 16.0),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text('Opsi satu'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 0, bottom: 16.0),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text('Opsi satu'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 0, bottom: 16.0),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text('Opsi satu'),
              ),
            ),
          ],
        ));
  }
}
