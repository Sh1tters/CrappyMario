boolean selectMode = false;
String selectedItem = ""; // ERASER

class MapCreator {
  // 2D Array of objects
  Cell[][] grid;
  // Number of columns and rows in the grid
  int cols = 50;
  int rows =50;
  public File file =new File(dataPath("")+"/editablemap.txt");
  MapCreator() {
    try {
      // Create a new file in the sketch directory
      println(dataPath(""));
      file.createNewFile();
    }
    catch(IOException ioe) {
      System.out.println("Exception ");
      ioe.printStackTrace();
    }
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
    // get data from editablemap txt file
    String[] lines = loadStrings(dataPath("")+"/editablemap.txt");
    for (int o = 0; o < lines.length; o++) {
      String col = lines[o].split(":")[0];
      String row = lines[o].split(":")[1];
      String item = lines[o].split(":")[2];
    }

    // The counter variables i and j are also the column and row numbers and
    // are used as arguments to the constructor for each object in the grid.
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j].display();
      }

      /*
   for (int c = 0; c < cols; c++)
       for (int z = 0; z < rows; z++) {
       println(col, row, item, c, z);
       }*/

      // display menu bar & items
      rect(100, 5, width-200, 100, 40);

      displayItems();
      displayItemsHighlighter();
      displayItemSelecter();
      onSelectMode();
    }
  }

  void main() {
    updateMap();
  }

  void displayItems() {
    blockpng.resize(40, 40);
    image(blockpng, 250, 50);
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
      } else if (mouseX > 400 && mouseX < 400 + 50 && mouseY > 50 && mouseY < 50 + 50) { // coin png clicked
        selectMode = true;
        selectedItem = "coin";
      } else if (mouseX > 550 && mouseX < 550 + 50 && mouseY > 50 && mouseY < 50 + 50) { // boost png clicked
        selectMode = true;
        selectedItem = "boost";
      } else if (mouseX > 700 && mouseX < 700 + 50 && mouseY > 50 && mouseY < 50 + 50) { // goomba png clicked
        selectMode = true;
        selectedItem = "goomba";
      } else if (mouseX > 850 && mouseX < 850 + 50 && mouseY > 50 && mouseY < 50 + 50) { // mario png clicked
        selectMode = true;
        selectedItem = "mario";
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
      } else if (selectedItem == "coin") {
        coinpng.resize(50, 50);
        image(coinpng, 400, 50);
        image(coinpng, mouseX, mouseY);
      } else if (selectedItem == "boost") {
        boostblock.resize(50, 50);
        image(boostblock, 550, 50);
        image(boostblock, mouseX, mouseY);
      } else if (selectedItem == "goomba") {
        for (int i = 0; i < goombaAlive.length; i++) {
          goombaAlive[i].resize(50, 50);
        }
        image(goombaAlive[(frameCount / 4) % runningLeft.length], 700, 50);
        image(goombaAlive[(frameCount / 4) % runningLeft.length], mouseX, mouseY);
      } else if (selectedItem == "goomba") {
        for (int i = 0; i < runningLeft.length; i++) {
          runningLeft[i].resize(50, 50);
        }
        image(runningLeft[(frameCount / 4) % runningLeft.length], 850, 50);
        image(runningLeft[(frameCount / 4) % runningLeft.length], mouseX, mouseY);
      }
    }
  }
}
