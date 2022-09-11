import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/ui/theme/color.dart';
import 'package:tic_tac_toe/utils/gameLogic.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: GameScreen());
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // init imp var
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0; // to check draw condition
  String result = "";
  // setting score combination to 0
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];

  // game component
  Game game = Game(); // object of class Game

  // initialize game board
  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board); // prints empty list
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery: size of current media/window
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        // bg color of app
        backgroundColor: MainColor.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // display text on screen
            Text(
              "Player Turn: ${lastValue}".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 58,
                ),
            ),
            SizedBox(
              height: 20.0,
            ),

            // create game board
            Container(
              width: boardWidth,
              height: boardWidth,
              child: GridView.count(
                crossAxisCount: Game.boardLength ~/ 3,
                padding: EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(Game.boardLength, (index) {
                  return InkWell(
                    onTap: gameOver
                        ? null
                        : () {
                            // click the button > add new value > refresh screen
                            // toggle player > button clickable only if button is empty
                            if (game.board![index] == "") {
                              setState(() {
                                game.board![index] = lastValue;
                                turn++;
                                gameOver = game.winnerCheck(
                                    lastValue, index, scoreboard, 3);

                                if (gameOver) {
                                  result = "$lastValue is the Winner";
                                } else if (!gameOver && turn == 9) {
                                  result = "Game Draw!";
                                  gameOver = true;
                                }

                                if (lastValue == "X") {
                                  lastValue = "O";
                                } else {
                                  lastValue = "X";
                                }
                              });
                            }
                          },
                    child: Container(
                      width: Game.blockSize,
                      height: Game.blockSize,
                      decoration: BoxDecoration(
                        color: MainColor.secondaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
                            color: game.board![index] == "X"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              result,
              style: TextStyle(color: Colors.white, fontSize: 54.0),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  // reset the board by erasing it's elements
                  game.board = Game.initGameBoard();
                  lastValue = "X";
                  gameOver = false;
                  turn = 0;
                  result = "";
                  scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                });
              },
              icon: Icon(Icons.replay),
              label: Text("Replay the Game"),
            )
          ],
        ));
  }
}
