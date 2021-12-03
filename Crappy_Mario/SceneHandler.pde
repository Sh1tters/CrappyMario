boolean toMenu = false;

public String gameState = "menu";

class SceneHandler {
  int start;
  int selected = 1;
  int levelSelected = 1;
  boolean keyReleased = false;
  int runtime = 0;
  int endruntime = 0;

  void main() {
    if (toMenu) {
      gameState = "menu";
    } else if (gameState == "Splash Screen") {
      splashScreen();
    } else if (gameState == "startGame") {
      startGame();
    } else if (gameState == "GameOver") {
      gameOver();
    } else if (gameState == "GameFinish") {
      gameFinish();
    } else if (gameState == "Levels") {
      levels();
    } else if(gameState == "Custom Map"){
      mc.main();
    } else if (gameState == "menu") {
      gameOver = false;
      menu();
    }

    if (gameOver && !toMenu) gameState = "GameOver";
  }

  void levels() {
    background(0);
    fill(255);
    imageMode(CENTER);
    smb.resize(582, 455);
    image(smb, width/2, height/5);
    textAlign(CENTER);
    text("Select a level!", width/2+75, height/3+100);

    textFont(menuFont, 60);
    for (int i = 1, w = width/2-250; i < 5; i++) {
      if (i == levelSelected) fill(#F22C2C);
      else fill(255);
      textAlign(LEFT);
      text(i, w, height/2+50);
      w += 200;
    }
    for (int i = 5, w = width/2-250; i < 9; i++) {
      if (i == levelSelected) fill(#F22C2C);
      else fill(255);
      textAlign(LEFT);
      text(i, w, height/2+250);
      w += 200;
    }
    for (int i = 9; i < 10; i++) {
      if (i == levelSelected) fill(#F22C2C);
      else fill(255);
      textAlign(CENTER);
      text("Mini Game", width/2+100, height/2+450);
    }


    if (keyReleased && keyCode == LEFT || keyReleased && key == 'a') {
      if (levelSelected != 1) levelSelected = levelSelected - 1;
      keyReleased = false;
    }
    if (keyReleased && keyCode == RIGHT || keyReleased && key == 'd') {
      if (levelSelected != 9) levelSelected = levelSelected + 1;
      keyReleased = false;
    }

    if (keyReleased && keyCode == ENTER) {
      if (levelSelected ==  1 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        map.level1();
        level = levelSelected;
      }
      if (levelSelected ==  2 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        map.level2();
        level = levelSelected;
      }
      if (levelSelected ==  3 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        map.level3();
        level = levelSelected;
      }
      if (levelSelected ==  4 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        map.level4();
        level = levelSelected;
      }
      if (levelSelected ==  5 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        map.level5();
        level = levelSelected;
      }
      if (levelSelected ==  6 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        map.level6();
        level = levelSelected;
      }
      if (levelSelected ==  7 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        map.level7();
        level = levelSelected;
      }
      if (levelSelected ==  8 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        map.level8();
        level = levelSelected;
      }

      if (levelSelected == 9 && gameState != "startGame") {
        player.pos.x = 100;
        player.pos.y = height - 300;
        player.jumpSpeed = 10;
        player.walkSpeed = 4;

        start = millis();
        gameState = "startGame";
        int rand = (int) random(Modes.length);
        gameMode = Modes[rand];
        map.levelInfinity();
        level = levelSelected;
        println(gameMode, Modes[rand]);
      }
    }
  }

  void splashScreen() {
    if (!startup.isPlaying()) {
      startup.play();
      startup.amp(0.2
        );
    }
    background(0);
    textFade();
    textFade2();
    fill(255, 255, 255, textAlpha);
    textAlign(CENTER);
    textSize(40);
    text("Crappy Entertainment", width/2, height/2);

    if (timePast > 10000) {
      background(0);
      textSize(15);
      textAlign(BOTTOM, RIGHT);
      fill(255, 255, 255, textAlpha0);
      text("Loading...", 1800, 1050);
    }

    if (timePast > 14500) {
      textSize(70);
      text("SUS", width/2, height/2);
    }

    if (timePast > 16000) {
      gameState = "menu";
    }
  }

  void menu() {
    background(0);
    textFont(menuFont, 60);
    textAlign(CENTER);
    fill(255);
    text("START GAME", width/2, height/2);
    text("HELP", width/2, height/2+100);
    text("ABOUT", width/2, height/2+200);
    text("CUSTOM MAPS", width/2, height/2+300);
    text("QUIT", width/2, height/2+400);
    imageMode(CENTER);
    smb.resize(582, 455);
    image(smb, width/2, height/5);

    if (selected == 1) image(mush, width/2-305, height/2-20);
    if (selected == 2) image(mush, width/2-155, height/2+100-20);
    if (selected == 3) image(mush, width/2-180, height/2+200-20);
    if (selected == 4) image(mush, width/2-200, height/2+300-20);
    if (selected == 5) image(mush, width/2-140, height/2+400-20);

    if (keyReleased && keyCode == UP || keyReleased && key == 'w') {
      if (selected != 1)  selected = selected - 1;
      keyReleased = false;
    }
    if (keyReleased && keyCode == DOWN || keyReleased && key == 's') {
      if (selected != 5)   selected = selected + 1;
      keyReleased = false;
    }

    if (keyReleased && keyCode == ENTER) {
      if (selected == 1) {
        gameState = "Levels";
        keyReleased = false;
      }
      if(selected == 4) {
        gameState = "Custom Map";
        keyReleased = false;
      }
      if (selected == 5) exit();
    }
  }


  void startGame() {
    int ms = millis()-start;
    // load levels
    map.loadMap();

    // load player
    player.updatePlayer();

    // You can iterate over an ArrayList in two ways.
    // The first is by counting through the elements:
    for (int i = 0; i < enemys.size(); i++) {
      Enemy en = enemys.get(i);
      en.update();
    }

    for (int i = 0; i < blocks.size(); i++) {
      Block bl = blocks.get(i);
      bl.update();
    }


    for (int i = 0; i < coins.size(); i++) {
      Coin c = coins.get(i);
      c.update();
    }

    for (int i = 0; i < launchs.size(); i++) {
      LaunchPad lp = launchs.get(i);
      lp.update();
    }

    if (levelSelected != 9) {
      finish.resize(200, 400);
      image(finish, 1700, map.pos.y-200);
    }


    textSize(20);
    fill(0);
    //text("Enemies: "+enemys.size(), 50, 20);
    // text("Blocks: " + blocks.size(), 50, 40);
    //  text("Map Length: "+map.mapLength, 50, 60);
    // text("Frames: "+frameRate, 500, 80);
    //   text("Player X,Y: " + player.pos.x + "," + player.pos.y, 50, 100);
    //   text("Lucky Blocks: " + luckyblocks.size(), 50, 120);
    //   text("Coins: " + coins.size(), 50, 140);
    //   text("Collected coins: " + collected_coins, 50, 160);

    fill(0);
    textFont(mainFont);
    text("MARIO", 80, 80);
    textSize(15);
    text("Score: " + score, 80, 120);
    textSize(20);
    text("RUN TIME", 300, 80);

    int sec = ms/1000;
    runtime = sec;
    text(runtime + "s", 300, 120);

    if (levelSelected == 9) text("Game mode: " + gameMode, width/2, height/2);
  }


  void gameOver() {
    gameOver = false;
    player.up = 0;
    player.down = 0;
    player.left = 0;
    player.right = 0;
    levelSelected = 1;
    // player.freezePlayer();
    for (int i = 0; i < enemys.size(); i++) {
      Enemy e = enemys.get(i);
      e.freezeEnemies();
    }

    textFont(gameOverFont);
    textAlign(CENTER);
    textSize(70);
    fill(0);
    text("GAME OVER!", width/2, height/4);
    textSize(40);
    text("Total Score: " + score, width/2, height/4+100);
    text("Run Time: " + runtime + " seconds", width/2, height/4+150);

    textSize(30);
    text("Press any key to return to menu", width/2, height/4+200);
  }

  void gameFinish() {
    gameFinish = false;
    player.up = 0;
    player.down = 0;
    player.left = 0;
    player.right = 0;
    // player.freezePlayer();
    for (int i = 0; i < enemys.size(); i++) {
      Enemy e = enemys.get(i);
      e.freezeEnemies();
    }

    textFont(gameOverFont);
    textAlign(CENTER);
    textSize(70);
    fill(0);
    text("LEVEL COMPLETED!", width/2, height/4);
    textSize(40);
    text("Total Score: " + score, width/2, height/4+100);
    text("Run Time: " + runtime + " seconds", width/2, height/4+150);

    textSize(30);
    text("Press any key to return to menu", width/2, height/4+200);
  }



  void textFade() {
    if (textAlpha > 0) {
      if (millis() > timeInterval + timePast && timePast < 2000) {
        timePast = millis();
        textFade *= -1;
      }
      textAlpha += textFade;
    }

    if (textAlpha <= 0) {
      background(0);
      timePast = millis();
      fill(255, 255, 255, 255);
      text("Crappy Mario", width/2, height/2);
    }
  }

  void textFade2() {
    if (millis() > timeInterval0 + timePast0) {
      timePast0 = millis();
      textFade0 *= -1;
    }
    textAlpha0 += textFade0;
  }
}
