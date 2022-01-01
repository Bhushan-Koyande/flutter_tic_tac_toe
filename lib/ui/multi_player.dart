import 'package:flutter/material.dart';
import 'package:flutter_ai_game/ui/field.dart';

class MultiPlayerGamePage extends StatefulWidget {
  final String p1;
  final String p2;

  const MultiPlayerGamePage({Key? key, required this.p1, required this.p2})
      : super(key: key);

  @override
  _MultiPlayerGamePageState createState() => _MultiPlayerGamePageState();
}

class _MultiPlayerGamePageState extends State<MultiPlayerGamePage> {
  bool oTurn = true;

  List<String> board = ['', '', '', '', '', '', '', '', ''];

  int xScore = 0;
  int oScore = 0;
  int filledBoxes = 0;

  _tapped(int idx) {
    setState(() {
      if (oTurn && board[idx] == '') {
        board[idx] = 'O';
        filledBoxes++;
      } else if (!oTurn && board[idx] == '') {
        board[idx] = 'X';
        filledBoxes++;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  _checkWinner() {
    bool foundWinner = false;
    // Checking rows
    if (board[0] == board[1] && board[0] == board[2] && board[0] != '') {
      foundWinner = true;
      _showWinDialog(board[0]);
    }
    if (board[3] == board[4] && board[3] == board[5] && board[3] != '') {
      foundWinner = true;
      _showWinDialog(board[3]);
    }
    if (board[6] == board[7] && board[6] == board[8] && board[6] != '') {
      foundWinner = true;
      _showWinDialog(board[6]);
    }

    // Checking Column
    if (board[0] == board[3] && board[0] == board[6] && board[0] != '') {
      foundWinner = true;
      _showWinDialog(board[0]);
    }
    if (board[1] == board[4] && board[1] == board[7] && board[1] != '') {
      foundWinner = true;
      _showWinDialog(board[1]);
    }
    if (board[2] == board[5] && board[2] == board[8] && board[2] != '') {
      foundWinner = true;
      _showWinDialog(board[2]);
    }

    // Checking Diagonal
    if (board[0] == board[4] && board[0] == board[8] && board[0] != '') {
      foundWinner = true;
      _showWinDialog(board[0]);
    }
    if (board[2] == board[4] && board[2] == board[6] && board[2] != '') {
      foundWinner = true;
      _showWinDialog(board[2]);
    } else if (filledBoxes == 9 && foundWinner == false) {
      _showDrawDialog();
    }
  }

  _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is Winner !"),
            actions: [
              TextButton(
                child: const Text(
                  "PLAY AGAIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.amber),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw !"),
            actions: [
              TextButton(
                child: const Text(
                  "PLAY AGAIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.amber),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        board[i] = '';
      }

      oTurn = true;
    });

    filledBoxes = 0;
  }

  void _resetScores() {
    setState(() {
      oScore = 0;
      xScore = 0;
    });
    _clearBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 28.0, 28.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.p1 + "(O) : ",
                  style: const TextStyle(fontSize: 22),
                ),
                Text(
                  oScore.toString(),
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.p2 + "(X) : ",
                  style: const TextStyle(fontSize: 22),
                ),
                Text(
                  xScore.toString(),
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (idx) {
                return Field(
                    idx: idx, onTap: _tapped, playerSymbol: board[idx]);
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
                onPressed: () {
                  _resetScores();
                },
                child: const Text(
                  'RESET',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
