import 'package:flutter/material.dart';
import 'package:flutter_ai_game/ui/game.dart';
import 'package:flutter_ai_game/ui/info.dart';
import 'package:flutter_ai_game/ui/user_info.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Tic Tac Toe",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InfoPage()));
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: FlutterLogo(
                size: 100.0,
                style: FlutterLogoStyle.markOnly,
              ),
            ),
            Center(
              child: ElevatedButtonTheme(
                data: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160.0, 60.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ))),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GamePage(
                                  title: title,
                                )));
                  },
                  child: const Text(
                    'Single Player',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButtonTheme(
                data: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160.0, 60.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ))),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserInfoPage()));
                  },
                  child: const Text(
                    'Multi Player',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
