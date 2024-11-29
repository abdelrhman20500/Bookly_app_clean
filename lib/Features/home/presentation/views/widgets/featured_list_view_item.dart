import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          image: const DecorationImage(image: AssetImage(Assets.itemPicture),
              fit: BoxFit.fill)
      ),
    );
  }
}
