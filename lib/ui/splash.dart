import 'package:flutter/material.dart';
import 'package:flutter_ai_game/ui/home.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 10,
        navigateAfterSeconds: const HomePage(title: 'Flutter Tic Tac Toe'),
        title: const Text('\n\nTIC TAC TOE',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.amber)),
        image: const Image(
          image: AssetImage('assets/my_icon.png'),
          fit: BoxFit.fill,
          height: 140.0,
          width: 140.0,
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: const TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.amber);
  }
}
