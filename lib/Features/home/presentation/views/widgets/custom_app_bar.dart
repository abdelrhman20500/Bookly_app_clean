import 'package:flutter/material.dart';

import '../../../../../Core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.logo, height: 50, width: 100,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,
            size: 32, color: Colors.white,))
        ],
      ),
    );
  }
}