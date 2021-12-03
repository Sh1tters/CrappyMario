// A Cell object
class Cell {
  // A cell object knows about its location in the grid
  // as well as its size with the variables x,y,w,h
  float x, y;   // x,y location
  float w, h;   // width and height

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }

  void display() {
    updateHighlight();
    onCellClicked();
    stroke(204, 102, 0);
    rect(x, y, w, h);
  }

  void updateHighlight() {
    if (selectMode) {
      if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
        fill(#81CFF5, 50); // 50
      } else {
        fill(#81CFF5, 100);
      }
    } else fill(#81CFF5, 100);
  }

  void onItemSelected() {
  }

  void onCellClicked() {
    //Right Click? Then reset cell to normal
    if (mousePressed && (mouseButton == RIGHT)) {
    }
  }
}
