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
    scoreboard: set scores of board as 0
}

Widget build > return Scaffold (
    declare backgroundColor of application,
    set body to center,
    children:[
        Text(display text for player's turn on screen)
        Container(
            width: width of game board,
            height: height of game board,
            child: (
                generate board
                children: create list with boardLength positions{
                    return InkWell(
                        onTap: {
                            if(board at index is empty string){
                                player1 taps the block to input their value; set the turn for next player,
                            }
                            if(all blocks filled){
                                "Game Draw"
                            }
                            {update players turn},
                            child: Container(
                                set width and height of block to blockSize,
                                make border radius circular,
                                child: Center(
                                    child: Text(
                                        set X and O color
                                    )
                                )
                            )
                        }
                    )
                }
            )
            Text(display `Player's Turn` text on screen)
            // replay game button
            ElevatedButton.icon(
                onPressed: (){
                    reinitialize game board with reset fields;
                    set player's turn to "X";
                    gameOver: not yet;
                    turn=0;
                    result: an empty string for combination;
                    scoreboard = [empty or combinations on 0s]
                }
            ),
            icon: renders replay icon,
            label: Text(replay button text)
        )
    ]
)
```
