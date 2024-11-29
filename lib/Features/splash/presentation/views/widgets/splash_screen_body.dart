import 'package:bookly_app_clean/Features/home/presentation/views/home_screen.dart';
import 'package:bookly_app_clean/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/assets.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();

    /// Animation....
    initSlidingAnimation();
    /// Navigate....
    navigateToHomeScreen();
    @override
    void dispose(){
      super.dispose();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.logo),
        const SizedBox(height: 4,),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }
  /// Animation method
  void initSlidingAnimation(){
    animationController =AnimationController(vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>
      (begin: const Offset(0,10) ,end: const Offset(0,0)).animate(animationController);

    animationController.forward();
  }

  void navigateToHomeScreen() {
    Future.delayed(const Duration(seconds: 2),()
    {
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>const HomeScreen()));
      // GoRouter.of(context).push(AppRouter.kHomeView
      // );
    });
  }
}


