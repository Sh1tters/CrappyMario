class Map {
  float mapLength;
  PVector size = new PVector();
  PVector pos = new PVector();
  // Constructor
  Map() {
    pos.x = 0;
    pos.y = height-100;
    size.x = 50;
    size.y = 50;

    mapLength = size.x;
  }

  void loadMap() {
    sky.resize(width, height);
    background(sky);
    image(cloud, width/2, height/2-300);
    image(cloud, width/2+400, height/2-500);
    image(cloud, width/2-600, height/2-550);
    
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 100; i++) {
      blockpng.resize(50, 50);
      image(blockpng, pos.x, pos.y);
      pos.x+=50;
    }
    
    if (level == 1) level1();
    if (level == 2) level2();
    if (level == 3) level3();
    if (level == 4) level4();
    if (level == 5) level5();
    if (level == 6) level6();
    if (level == 7) level7();
    if (level == 8) level8();

    for (int i = 1; i < 9; i++) {
      if (i == level) {
        textAlign(CENTER);
        text("Level " + i, width/2, height/2);
      }
    }
  }

  // MAP STRUCTURE
  void level1() {
  }
  void level2() {
  }
  void level3() {
  }
  void level4() {
  }
  void level5() {
  }
  void level6() {
  }
  void level7() {
  }
  void level8() {
  }
}
