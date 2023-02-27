import 'package:flutter/material.dart';


class EducationTile extends StatelessWidget {
  const EducationTile({super.key, required this.title, required this.origin, required this.date});

  final String title;
  final String origin;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline6,),
          const SizedBox(height: 4,),
          Text(origin),
          const SizedBox(height: 4,),
          Text(date, style: Theme.of(context).textTheme.caption,)
        ],
      ),
    );
  }
}