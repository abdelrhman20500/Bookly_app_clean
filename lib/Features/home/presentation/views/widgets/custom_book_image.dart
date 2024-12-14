import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6/4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            image: const DecorationImage(image: AssetImage(Assets.itemPicture),
                fit: BoxFit.fill)
        ),
      ),
    );
  }
}
