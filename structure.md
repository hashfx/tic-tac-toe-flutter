## color scheme of app

### lib > ui > theme > color.dart

## logic of the game

### lib > utils > gameLogic.dart

```dart
class Player{
    declare X and O player variable here with empty string for entering value
}
class Game{
    boardLength: 3x3 board,
    blockSize: size of block,
    board: empty board with string input type,
    initGameBoard(): generate list of length boardLength and index board with empty string,

    bool winnerCheck() {

    }
}
```

### lib > main.dart

```dart
class _GameScreenState extends State<GameScreen> {
    lastValue: player who has played their turn, init to "X",
    gameOver: init to false,
    turn: if no expected combinations occur, game is drawn,
    result: combinations for winning a game; init to empty string
}

Widget build > return Scaffold (
    declare backgroundColor of application,
    set body to center,
    children:[
        Text(display text on screen)
    ]
)
```
