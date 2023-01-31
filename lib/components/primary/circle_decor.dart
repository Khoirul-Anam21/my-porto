import 'package:flutter/material.dart';

class CircleDecoration extends StatelessWidget {
  const CircleDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor
            ),
          ),
        ),
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor
          ),
        )
      ],
    );
  }
}
