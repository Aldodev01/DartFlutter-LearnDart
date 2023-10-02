import 'package:flutter/material.dart';

class ImageWithLoading extends StatelessWidget {
  const ImageWithLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('icons/my_icon.png'),
      semanticLabel: "my_icon",
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
