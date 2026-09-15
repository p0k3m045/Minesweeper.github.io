// ============================================
// MINESWEEPER
// ============================================


// GAME SETTINGS

int rows = 16;
int cols = 30;
int numberOfMines = 80;


// GLOBAL VARIABLES

float cellSize;
float boardX;
float boardY;

Cell[][] board;

boolean gameOver = false;
boolean gameWon = false;
boolean firstClick = true;

int appWidth;
int appHeight;

// ============================================
// SETUP
// ============================================

void setup() {

  fullScreen();

  appWidth = displayWidth;
  appHeight = displayHeight;

  createBoard();
}


// ============================================
// CREATE BOARD
// ============================================

void createBoard() {

  // Calculate the cell size
  cellSize = min(
    appWidth * 0.9 / cols,
    appHeight * 0.8 / rows
    );


  // Center the board
  boardX = (appWidth - cols * cellSize) / 2;
  boardY = (appHeight - rows * cellSize) / 2;


  // Create the board array
  board = new Cell[rows][cols];


  // Create every cell
  for (int row = 0; row < rows; row++) {

    for (int col = 0; col < cols; col++) {

      float x = boardX + col * cellSize;
      float y = boardY + row * cellSize;

      board[row][col] = new Cell(
        x,
        y,
        cellSize,
        row,
        col
        );
    }
  }


  // Reset the game

  firstClick = true;
  gameOver = false;
  gameWon = false;
}


// ============================================
// PLACE MINES
// ============================================

void placeMines(int safeRow, int safeCol) {

  int minesPlaced = 0;


  while (minesPlaced < numberOfMines) {

    // Choose a random location

    int randomRow = int(random(rows));
    int randomCol = int(random(cols));


    // Check if this is the first clicked cell

    boolean isFirstClick =
      randomRow == safeRow &&
      randomCol == safeCol;


    // Only place a mine if this isn't
    // the first clicked cell and isn't already a mine

    if (
      !isFirstClick &&
      !board[randomRow][randomCol].mine
      ) {

      board[randomRow][randomCol].mine = true;

      minesPlaced++;
    }
  }
}


// ============================================
// CALCULATE NUMBERS
// ============================================

void calculateNumbers() {

  for (int row = 0; row < rows; row++) {

    for (int col = 0; col < cols; col++) {


      // Don't calculate numbers for mines

      if (!board[row][col].mine) {

        int nearbyMines = 0;


        // Check surrounding cells

        for (int rowOffset = -1; rowOffset <= 1; rowOffset++) {

          for (int colOffset = -1; colOffset <= 1; colOffset++) {

            int checkRow = row + rowOffset;
            int checkCol = col + colOffset;


            // Make sure the cell is inside the board

            if (
              checkRow >= 0 &&
              checkRow < rows &&
              checkCol >= 0 &&
              checkCol < cols
              ) {


              // Add to the count if there is a mine

              if (board[checkRow][checkCol].mine) {

                nearbyMines++;
              }
            }
          }
        }


        // Save the number

        board[row][col].nearbyMines = nearbyMines;
      }
    }
  }
}


// ============================================
// DRAW
// ============================================

void draw() {

  background(40);


  // Draw every cell

  for (int row = 0; row < rows; row++) {

    for (int col = 0; col < cols; col++) {

      board[row][col].display();
    }
  }


  // Draw instructions

  fill(255);

  textAlign(CENTER, CENTER);

  textSize(25);

  text(
    "MINESWEEPER | Left Click: Reveal | Right Click: Flag | R: Restart",
    width / 2,
    boardY - 40
    );


  // Game over message

  if (gameOver) {

    fill(255, 60, 60);

    textSize(60);

    text(
      "GAME OVER!",
      width / 2,
      height / 2
      );
  }


  // Win message

  if (gameWon) {

    fill(60, 255, 100);

    textSize(60);

    text(
      "YOU WIN!",
      width / 2,
      height / 2
      );
  }
}


// ============================================
// MOUSE PRESSED
// ============================================

void mousePressed() {


  // Don't allow clicking after the game ends

  if (gameOver || gameWon) {

    return;
  }


  // Check every cell

  for (int row = 0; row < rows; row++) {

    for (int col = 0; col < cols; col++) {


      Cell currentCell = board[row][col];


      // Check if the mouse is inside this cell

      if (
        mouseX >= currentCell.x &&
        mouseX < currentCell.x + cellSize &&
        mouseY >= currentCell.y &&
        mouseY < currentCell.y + cellSize
        ) {


        // LEFT CLICK

        if (mouseButton == LEFT) {


          // Generate mines after the first click

          if (firstClick) {

            placeMines(
              currentCell.row,
              currentCell.col
              );

            calculateNumbers();

            firstClick = false;
          }


          // Reveal the cell

          currentCell.reveal();


          // Check if the player clicked a mine

          if (currentCell.mine) {

            gameOver = true;

            revealAllMines();
          }


          // Check if the player won

          checkWin();
        }


        // RIGHT CLICK

        if (mouseButton == RIGHT) {


          // Don't flag revealed cells

          if (!currentCell.revealed) {

            // Toggle the flag

            currentCell.flagged = !currentCell.flagged;
          }
        }


        // Stop checking cells

        return;
      }
    }
  }
}


// ============================================
// REVEAL ALL MINES
// ============================================

void revealAllMines() {

  for (int row = 0; row < rows; row++) {

    for (int col = 0; col < cols; col++) {

      if (board[row][col].mine) {

        board[row][col].revealed = true;
      }
    }
  }
}


// ============================================
// CHECK FOR WIN
// ============================================

void checkWin() {

  int revealedCells = 0;


  // Count revealed cells

  for (int row = 0; row < rows; row++) {

    for (int col = 0; col < cols; col++) {

      if (board[row][col].revealed) {

        revealedCells++;
      }
    }
  }


  // Calculate safe cells

  int safeCells = rows * cols - numberOfMines;


  // Check if all safe cells are revealed

  if (revealedCells == safeCells) {

    gameWon = true;
  }
}


// ============================================
// KEYBOARD
// ============================================

void keyPressed() {

  // Press R to restart

  if (key == 'r' || key == 'R') {

    createBoard();
  }
}


// ============================================
// CELL CLASS
// ============================================

class Cell {

  String directory = "../../Dependencies/Images/";
  String flagDirectory = directory + "redFlag.png";

  // Position

  float x;
  float y;


  // Size

  float size;


  // Position in the array

  int row;
  int col;


  // Cell information

  boolean mine = false;
  boolean revealed = false;
  boolean flagged = false;

  int nearbyMines = 0;


  // ==========================================
  // CONSTRUCTOR
  // ==========================================

  Cell(
    float tempX,
    float tempY,
    float tempSize,
    int tempRow,
    int tempCol
    ) {

    x = tempX;
    y = tempY;

    size = tempSize;

    row = tempRow;
    col = tempCol;
  }


  // ==========================================
  // DISPLAY
  // ==========================================

  void display() {


    stroke(100);
    strokeWeight(1);


    // UNREVEALED CELL

    if (!revealed) {

      fill(106, 245, 107);

      rect(
        x,
        y,
        size,
        size
        );


      // Draw flag

      if (flagged) {

        fill(255, 60, 60);


        PImage flagImage = loadImage(flagDirectory);
        
        imageMode(CENTER);
        
        image(flagImage, 
          x + size / 2,
          y + size / 2,
          100,
          100
          );
      }
    }


    // REVEALED CELL

    else {

      fill(53, 131, 54);

      rect(
        x,
        y,
        size,
        size
        );


      // Draw mine

      if (mine) {

        fill(30);

        ellipse(
          x + size / 2,
          y + size / 2,
          size * 0.6,
          size * 0.6
          );
      }


      // Draw number

      else if (nearbyMines > 0) {

        fill(0);

        textAlign(CENTER, CENTER);

        textSize(size * 0.6);

        text(
          nearbyMines,
          x + size / 2,
          y + size / 2
          );
      }
    }
  }


  // ==========================================
  // REVEAL CELL
  // ==========================================

  void reveal() {


    // Don't reveal flagged cells

    if (flagged) {

      return;
    }


    // Don't reveal cells twice

    if (revealed) {

      return;
    }


    // Reveal the cell

    revealed = true;


    // If there are no nearby mines,
    // reveal surrounding cells

    if (
      nearbyMines == 0 &&
      !mine
      ) {

      revealNeighbors();
    }
  }


  // ==========================================
  // REVEAL NEIGHBORS
  // ==========================================

  void revealNeighbors() {


    // Check surrounding cells

    for (int rowOffset = -1; rowOffset <= 1; rowOffset++) {

      for (int colOffset = -1; colOffset <= 1; colOffset++) {


        int checkRow = row + rowOffset;
        int checkCol = col + colOffset;


        // Make sure the cell exists

        if (
          checkRow >= 0 &&
          checkRow < rows &&
          checkCol >= 0 &&
          checkCol < cols
          ) {


          Cell neighbor = board[checkRow][checkCol];


          // Reveal safe cells

          if (
            !neighbor.revealed &&
            !neighbor.mine
            ) {

            neighbor.reveal();
          }
        }
      }
    }
  }
}
