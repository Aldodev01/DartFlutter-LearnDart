import 'package:flutter/material.dart';

class CListViewer extends StatelessWidget {
  const CListViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 160,
          color: Colors.red,
        ),
        Container(
          width: 160,
          color: Colors.blue,
        ),
        Container(
          width: 160,
          color: Colors.green,
        ),
        Container(
          width: 160,
          color: Colors.yellow,
        ),
        Container(
          width: 160,
          color: Colors.orange,
        ),
      ],
    );
  }
}
