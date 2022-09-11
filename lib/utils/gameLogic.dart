class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardLength = 9; // we will creare a board of 3*3 blocks;
  static final blockSize = 100.0;

  // create empty board with string input
  List<String>? board;

  // generate list of length boardLength and index board with empty strings
  static List<String>? initGameBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  // algorithm to check winner combination
  bool winnerCheck(
      String player, int index, List<int> scoreBoard, int gridSize) {
    // declare rows and columns
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreBoard[row] += score;
    scoreBoard[gridSize + col] += score;
    if (row == col) scoreBoard[2 * gridSize] += score;
    if (gridSize - 1 - col == row) scoreBoard[2 * gridSize + 1] += score;

    // check if scoreBoard value is 3 or -3
    if (scoreBoard.contains(3) || scoreBoard.contains(-3)) {
      return true;
    }
    ;

    // return false initially
    return false;
  }
}
