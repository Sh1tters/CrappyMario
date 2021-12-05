import java.io.FileWriter;
import java.io.*;
FileWriter fw;
BufferedWriter bw;

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
    stroke(204, 102, 0);
    rect(x, y, w, h);
    test();
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

  void test() {
    for (int i = 0; i < mc.cols; i++) {
      for (int j = 0; j < mc.rows; j++) {
        if (selectMode && mouseReleased && (mouseButton == LEFT) && mouseX > i*50 && mouseX < i*50 + 50 && mouseY > j*50 && mouseY < j*50 + 50) {
          FileWriter fw;
          BufferedWriter bw;
          PrintWriter pw;
          try {
            fw = new FileWriter(mc.file, true);///true = append
            bw = new BufferedWriter(fw);
            pw = new PrintWriter(bw);

            // save col & row with current item to txt file
            String data = i+":"+j+":"+selectedItem+":"+i*50+":"+j*50+":"+w+":"+h;

            pw.write(data + "\n");
            pw.close();
          }
          catch(IOException ioe) {
            System.out.println("Exception ");
            ioe.printStackTrace();
          }

          mouseReleased = false;
        }
        //grid[i][j] = new Cell(i*50, j*50, 50, 50);
      }
    }
  }
}
