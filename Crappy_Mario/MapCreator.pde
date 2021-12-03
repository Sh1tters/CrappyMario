boolean selectMode = false;
String selectedItem = ""; // ERASER

class MapCreator {
  // 2D Array of objects
  Cell[][] grid;
  // Number of columns and rows in the grid
  int cols = 50;
  int rows =50;
  MapCreator() {
    grid = new Cell[cols][rows];
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        // Initialize each object
        grid[i][j] = new Cell(i*50, j*50, 50, 50);
      }
    }
  }

  void updateMap() {
    background(0);
    // The counter variables i and j are also the column and row numbers and
    // are used as arguments to the constructor for each object in the grid.
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j].display();
      }
    }

    // display menu bar & items
    rect(100, 5, width-200, 100);

    displayItems();
    displayItemsHighlighter();
    displayItemSelecter();
    onSelectMode();
  }

  void main() {
    updateMap();
  }

  void displayItems() {
    blockpng.resize(40, 40);
    image(blockpng, 250, 50);
    //boostblock, goomba, coinpng
    coinpng.resize(40, 40);
    image(coinpng, 400, 50);
    boostblock.resize(40, 40);
    image(boostblock, 550, 50);

    for (int i = 0; i < goombaAlive.length; i++) {
      goombaAlive[i].resize(40, 40);
    }
    image(goombaAlive[(frameCount / 3) % goombaAlive.length], 700, 50);

    for (int i = 0; i < runningLeft.length; i++) {
      runningLeft[i].resize(40, 40);
    }
    image(runningLeft[(frameCount / 4) % runningLeft.length], 850, 50);
  }

  void displayItemsHighlighter() {
    if (mouseX > 250 && mouseX < 250 + 50 && mouseY > 50 && mouseY < 50 + 50) {
      blockpng.resize(50, 50);
      image(blockpng, 250, 50);
    }
    if (mouseX > 400 && mouseX < 400 + 50 && mouseY > 50 && mouseY < 50 + 50) {
      coinpng.resize(50, 50);
      image(coinpng, 400, 50);
    }
    if (mouseX > 550 && mouseX < 550 + 50 && mouseY > 50 && mouseY < 50 + 50) {
      boostblock.resize(50, 50);
      image(boostblock, 550, 50);
    }
    if (mouseX > 700 && mouseX < 700 + 50 && mouseY > 50 && mouseY < 50 + 50) {
      for (int i = 0; i < goombaAlive.length; i++) {
        goombaAlive[i].resize(50, 50);
      }
      image(goombaAlive[(frameCount / 3) % goombaAlive.length], 700, 50);
    }

    if (mouseX > 850 && mouseX < 850 + 50 && mouseY > 50 && mouseY < 50 + 50) {
      for (int i = 0; i < runningLeft.length; i++) {
        runningLeft[i].resize(50, 50);
      }
      image(runningLeft[(frameCount / 4) % runningLeft.length], 850, 50);
    }
  }

  void displayItemSelecter() {
    if (mousePressed && (mouseButton == LEFT)) {
      if (mouseX > 250 && mouseX < 250 + 50 && mouseY > 50 && mouseY < 50 + 50) { // block png clicked
        selectMode = true;
        selectedItem = "block";
      }
    } else if (mousePressed && (mouseButton == RIGHT)) {
      selectMode = false;
      selectedItem = "";
    }
  }

  void onSelectMode() {
    if (selectMode) {
      if (selectedItem == "block") {
        blockpng.resize(50, 50);
        image(blockpng, 250, 50);
        image(blockpng, mouseX, mouseY);
      }
    }
  }
}
