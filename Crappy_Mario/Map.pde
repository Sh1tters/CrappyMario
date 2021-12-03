import java.util.Timer;
import java.util.TimerTask;

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

    for (int i = 1; i < 9; i++) {
      if (i == level) {
        textAlign(CENTER);
        text("Level " + i, width/2, height/2);
      }
    }
  }

  // MAP STRUCTURE
  void level1() {
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      //blockpng.resize(50, 50);
      //image(blockpng, pos.x, pos.y);
      pos.x+=50;
    }
    for (int i = 0, x = 1200; i <8; i++) {
      blocks.add(new Block(50, 50, x, pos.y-50));
      x = x + 50;
    }
    for (int i = 0, x = 1250; i < 7; i++) {
      blocks.add(new Block(50, 50, x, pos.y-100));
      x = x + 50;
    }
    for (int i = 0, x = 1300; i < 6; i++) {
      blocks.add(new Block(50, 50, x, pos.y-150));
      x = x + 50;
    }
    for (int i = 0, x = 1350; i <5; i++) {
      blocks.add(new Block(50, 50, x, pos.y-200));
      x = x + 50;
    }
    for (int i = 0, x = 1400; i <4; i++) {
      blocks.add(new Block(50, 50, x, pos.y-250));
      x = x + 50;
    }
    for (int i = 0, x = 1450; i <3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-300));
      x = x + 50;
    }

    coins.add(new Coin(25, 25, 250, pos.y-150));
    coins.add(new Coin(25, 25, 1500, pos.y-450));
    enemys.add(new Enemy(50, 50, 400, pos.y-50));
    enemys.add(new Enemy(50, 50, 1800, pos.y-50));
    launchs.add(new LaunchPad(50, 50, 900, pos.y-101));
    launchs.add(new LaunchPad(50, 50, 950, pos.y-101));
    launchs.add(new LaunchPad(50, 50, 850, pos.y-101));
    launchs.add(new LaunchPad(50, 50, 800, pos.y-101));
    launchs.add(new LaunchPad(50, 50, 900, pos.y-800));
    launchs.add(new LaunchPad(50, 50, 950, pos.y-800));
    launchs.add(new LaunchPad(50, 50, 850, pos.y-800));
    launchs.add(new LaunchPad(50, 50, 800, pos.y-800));
  }


  void level2() {
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      pos.x+=50;
    }


    for (int i = 0, x = 400; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-105));
      x+=50;
    }
    coins.add(new Coin(25, 25, 400, pos.y-50));
    coins.add(new Coin(25, 25, 450, pos.y-50));
    coins.add(new Coin(25, 25, 500, pos.y-50));


    for (int i = 0, x = 1400, y = 50; i < 4; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1450, y = 100; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1500, y = 150; i < 2; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1550, y = 200; i < 1; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }

    for (int i = 0, x = 400; i < 10; i++) {
      enemys.add(new Enemy(50, 50, x, pos.y-50));
      x+=50;
    }
  }
  void level3() {
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      pos.x+=50;
    }


    for (int i = 0, x = 400, y = 50; i < 7; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 450, y = 100; i < 5; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 500, y = 150; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 550, y = 200; i < 1; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    coins.add(new Coin(25, 25, 550, pos.y-250));


    for (int i = 0, x = 1400, y = 50; i < 5; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }

    for (int i = 0, x = 1450, y = 100; i < 4; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1500, y = 150; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1550, y = 200; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1600, y = 250; i < 2; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1650, y = 300; i < 1; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    coins.add(new Coin(25, 25, 1650, pos.y-350));
  }
  void level4() {
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      pos.x+=50;
    }

    for (int i = 0, x = 1400, y = 50; i < 7; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1450, y = 100; i < 6; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1500, y = 150; i < 5; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1550, y = 200; i < 4; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1600, y = 250; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1650, y = 300; i < 2; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    for (int i = 0, x = 1700, y = 350; i < 1; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      x+=50;
    }
    coins.add(new Coin(50, 50, width/2, height/2-300));
  }
  void level5() {
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      pos.x+=50;
    }

    for (int i = 0, x = 400; i < 4; i++) {
      blocks.add(new Block(50, 50, x, pos.y-101));
      x+=50;
    }

    for (int i = 0, x = 800; i < 2; i++) {
      blocks.add(new Block(50, 50, x, pos.y-101));
      coins.add(new Coin(25, 25, x, pos.y-50));
      x+=50;
    }

    enemys.add(new Enemy(200, 200, 1200, pos.y-125));
  }
  void level6() {
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      pos.x+=50;
    }
    for (int i = 0, x = 200; i < 16; i++) {
      blocks.add (new Block(50, 50, x, pos.y-50));
      x+=50;
    }
    for (int i = 0, x = 250; i < 15; i++) {
      blocks.add (new Block(50, 50, x, pos.y-100));
      x+=50;
    }
    for (int i = 0, x = 300; i < 14; i++) {
      blocks.add (new Block(50, 50, x, pos.y-150));
      x+=50;
    }
    for (int i = 0, x = 350; i < 13; i++) {
      blocks.add (new Block(50, 50, x, pos.y-200));
      x+=50;
    }
    for (int i = 0, x = 400; i < 12; i++) {
      blocks.add (new Block(50, 50, x, pos.y-250));
      x+=50;
    }
    for (int i = 0, x = 450; i < 11; i++) {
      blocks.add (new Block(50, 50, x, pos.y-300));
      x+=50;
    }
    for (int i = 0, x = 500; i < 10; i++) {
      blocks.add (new Block(50, 50, x, pos.y-350));
      x+=50;
    }
    for (int i = 0, x = 550; i < 9; i++) {
      blocks.add (new Block(50, 50, x, pos.y-400));
      x+=50;
    }
    for (int i = 0, x = 600; i < 8; i++) {
      blocks.add (new Block(50, 50, x, pos.y-450));
      x+=50;
    }
    for (int i = 0, x = 650; i < 7; i++) {
      blocks.add (new Block(50, 50, x, pos.y-500));
      x+=50;
    }
    for (int i = 0, x = 700; i < 6; i++) {
      blocks.add (new Block(50, 50, x, pos.y-550));
      x+=50;
    }
    for (int i = 0, x = 750; i < 5; i++) {
      blocks.add (new Block(50, 50, x, pos.y-600));
      x+=50;
    }
    for (int i = 0, x = 800; i < 4; i++) {
      blocks.add (new Block(50, 50, x, pos.y-650));
      x+=50;
    }
    for (int i = 0, x = 850; i < 3; i++) {
      blocks.add (new Block(50, 50, x, pos.y-700));
      x+=50;
    }
    for (int i = 0, x = 900; i < 2; i++) {
      blocks.add (new Block(50, 50, x, pos.y-750));
      x+=50;
    }
    coins.add (new Coin(25, 25, 1150, pos.y-850));
  }
  void level7() {
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      pos.x+=50;
    }

    for (int i = 0, x = 450; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-50));
      x+=50;
    }
    for (int i = 0, x = 500, y = 50; i < 4; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      y+=50;
    }


    for (int i = 0, x = 850; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-50));
      x+=50;
    }
    for (int i = 0, x = 900, y = 50; i < 4; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      y+=50;
    }

    for (int i = 0, x = 1200; i < 3; i++) {
      blocks.add(new Block(50, 50, x, pos.y-50));
      x+=50;
    }
    for (int i = 0, x = 1250, y = 50; i < 10; i++) {
      blocks.add(new Block(50, 50, x, pos.y-y));
      y+=50;
    }

    coins.add(new Coin(25, 25, 150, pos.y-50));
    coins.add(new Coin(25, 25, 200, pos.y-50));
    coins.add(new Coin(25, 25, 250, pos.y-50));
    coins.add(new Coin(25, 25, 300, pos.y-50));
    coins.add(new Coin(25, 25, 350, pos.y-50));
    coins.add(new Coin(25, 25, 400, pos.y-50));
    coins.add(new Coin(25, 25, 1150, pos.y-50));
    coins.add(new Coin(25, 25, 1100, pos.y-50));
    coins.add(new Coin(25, 25, 1050, pos.y-50));
    coins.add(new Coin(25, 25, 1100, pos.y-100));
    coins.add(new Coin(25, 25, 1100, pos.y-150));
    coins.add(new Coin(25, 25, 1100, pos.y-200));
    coins.add(new Coin(25, 25, 1100, pos.y-500));

    enemys.add(new Enemy(50, 50, 200, pos.y-50));
  }
  void level8() {
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();
    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      pos.x+=50;
    }
  }


  void levelInfinity() {
    Timer timer = new Timer();
    blocks.clear();
    enemys.clear();
    coins.clear();
    launchs.clear();

    //GROUND
    pos.x = -50;
    for (int i = 0; i < 40; i++) {
      blocks.add(new Block(50, 50, pos.x, pos.y));
      pos.x+=50;
    }

    for (int i = 0, y = 50; i < 30; i++) {
      blocks.add(new Block(50, 50, 0, pos.y-y));
      y += 50;
    }

    for (int i = 0, y = 50; i < 30; i++) {
      blocks.add(new Block(50, 50, pos.x-50, pos.y-y));
      y+=50;
    }

    if (gameMode == "Goomba Mines") {
      timer.schedule(new TimerTask() {

        @Override
          public void run() {
          if (gameOver || gameFinish || gameState == "Levels" || gameMode == "") timer.cancel();
          enemys.add(new Enemy(50, 50, random(50, width-50), pos.y-50));
        }
      }
      , 0, 500); // 1000 = 1 Sek.
      timer.schedule(new TimerTask() {

        @Override
          public void run() {
          if (gameOver || gameFinish || gameState == "Levels" || gameMode == "") timer.cancel();
          coins.add(new Coin(25, 25, random(50, width-50), random(pos.y-50, pos.y-200)));
        }
      }
      , 0, 4000); // 1000 = 1 Sek.
    }
    if (gameMode == "Goomba Weather") {
      timer.schedule(new TimerTask() {

        @Override
          public void run() {
          if (gameOver || gameFinish || gameState == "Levels") timer.cancel();
          enemys.add(new Enemy(50, 50, random(50, width-50), random(pos.y-300, pos.y-900)));
        }
      }
      , 0, 1500); // 1000 = 1 Sek.
      timer.schedule(new TimerTask() {
 
        @Override
          public void run() {
          if (gameOver || gameFinish || gameState == "Levels" || gameMode == "") timer.cancel();
          coins.add(new Coin(25, 25, random(50, width-50), random(pos.y-50, pos.y-200)));
        }
      }
      , 0, 4000); // 1000 = 1 Sek.
    }
  }
}
