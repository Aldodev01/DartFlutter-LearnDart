import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/gif.gif',
        image: 'https://picsum.photos/250?image=9',
      ),
    );
  }
}
