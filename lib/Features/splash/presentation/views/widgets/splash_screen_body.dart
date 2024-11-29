import 'package:flutter/material.dart';
import '../../../../../Core/utils/assets.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image(image: AssetImage(Assets.logo)))
      ],
    );
  }
}
