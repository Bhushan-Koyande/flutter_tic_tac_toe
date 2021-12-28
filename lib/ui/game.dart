import 'package:flutter/material.dart';
import 'package:flutter_ai_game/ai/ai.dart';
import 'field.dart';
import 'game_handler.dart';

class GamePage extends StatefulWidget {
  final String title;

  const GamePage({Key? key, required this.title}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<int> board;
  late int _currentPlayer;

  late GameHandler _handler;

  _GamePageState() {
    this._handler = GameHandler(_movePlayed, _onGameEnd);
  }

  void _onGameEnd(int winner) {
    var title = "Game over !";
    var content = "You lose :(";
    switch (winner) {
      case Ai.HUMAN:
        title = "Congratulations !";
        content = "You managed to beat an unbeatable AI!";
        break;
      case Ai.AI_PLAYER:
        title = "Game Over !";
        content = "You lose :(";
        break;
      default:
        title = "Draw !";
        content = "No winners here!";
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    setState(() {
                      reinitialize();
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text(
                    "RESTART",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  void _movePlayed(int idx) {
    setState(() {
      board[idx] = _currentPlayer;

      if (_currentPlayer == Ai.HUMAN) {
        _currentPlayer = Ai.AI_PLAYER;
        _handler.onHumanPlayed(board);
      } else {
        _currentPlayer = Ai.HUMAN;
      }
    });
  }

  String getSymbolForIdx(int idx) {
    return Ai.SYMBOLS[board[idx]].toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reinitialize();
  }

  reinitialize() {
    _currentPlayer = Ai.HUMAN;
    // generate the initial board
    board = List.generate(9, (idx) => 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(60),
            child: Text(
              "You are playing as X",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (idx) {
                return Field(
                    idx: idx,
                    onTap: _movePlayed,
                    playerSymbol: getSymbolForIdx(idx));
              }),
            ),
          )
        ],
      ),
    );
  }
}
