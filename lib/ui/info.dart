import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Flutter Tic Tac Toe",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Created with ",
                    style: TextStyle(color: Colors.black38, fontSize: 22.0)),
                Icon(
                  Icons.favorite,
                  color: Colors.amber,
                ),
                Text(" by",
                    style: TextStyle(color: Colors.black38, fontSize: 22.0))
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text("BHUSHAN KOYANDE",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0)),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "Tutorial from Internet",
              style: TextStyle(color: Colors.black38, fontSize: 22.0),
            ),
            const SizedBox(height: 40.0),
            const Text(
              "CONTACT ME",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
            const SizedBox(height: 40.0),
            const Text(
              "bhushankoyande446@gmail.com",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            const SizedBox(height: 40.0),
            const Text(
              "github.com/Bhushan-Koyande",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
