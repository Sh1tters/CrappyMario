public String gameState = "startGame";

class SceneHandler {

  void main() {
    if (gameState == "Splash Screen") {
      splashScreen();
    }

    if (gameState == "menu") {
      menu();
    }
    if (gameState == "startGame") {
      startGame();
    }

    if (gameState == "GameOver") {
      gameOver();
    }


    if (gameOver) gameState = "GameOver";
  }

  void splashScreen() {
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
    textAlign(CENTER);
    text("MENU SCREEN", width/2, height/2);
  }

  void startGame() {
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

    for (int i = 0; i < luckyblocks.size(); i++) {
      LuckyBlock lb = luckyblocks.get(i);
      lb.update();
    }

    for (int i = 0; i < coins.size(); i++) {
      Coin c = coins.get(i);
      c.update();
    }


    textSize(10);
    fill(0);
    text("Enemies: "+enemys.size(), 50, 20);
    text("Blocks: " + blocks.size(), 50, 40);
    text("Map Length: "+map.mapLength, 50, 60);
    text("Frames: "+frameRate, 50, 80);
    text("Player X,Y: " + player.pos.x + "," + player.pos.y, 50, 100);
    text("Lucky Blocks: " + luckyblocks.size(), 50, 120);
    text("Coins: " + coins.size(), 50, 140);
    text("Collected coins: " + collected_coins, 50, 160);
  }


  void gameOver() {
    resetKeys();
    player.freezePlayer();
    for (int i = 0; i < enemys.size(); i++) {
      Enemy e = enemys.get(i);
      e.freezeEnemies();
    }

    textAlign(CENTER);
    textSize(70);
    text("GAME OVER!", width/2, height/2);
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
