import processing.sound.*;
SoundFile startup;

Map map;
SceneHandler sh;
Player player;
MapCreator mc;
Enemy[] enemy;
Block[] block;
Coin[] coin;
LaunchPad[] launch;
PFont mainFont, gameOverFont, menuFont, scoreFont;

int unit = 3;
ArrayList<Enemy> enemys = new ArrayList<Enemy>();
ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<Coin> coins = new ArrayList<Coin>();
ArrayList<LaunchPad> launchs = new ArrayList<LaunchPad>();

PImage blockpng, cloud, sky, luckyblockpng, standingStill, coinpng, goombaDead, marioDead, smb, mush, finish, boostblock;
PImage[] runningLeft, runningRight, jumpingRight, jumpingLeft, goombaAlive;

public int level;
public int collected_coins;
public int score = 000000;
public int totalscoreSession = 0;
public boolean gameOver = false;
public boolean gameFinish = false;
public String gameMode = "";
public String[] Modes = {"Goomba Mines", "Goomba Weather"};
//Falling Goombas

/* Splash Screen Variables */
//1
float timeInterval;
float timePast;
int textAlpha = 100;
int textFade = 2;

//2
float timeInterval0;
float timePast0;
int textAlpha0 = 100;
int textFade0 = 5;


boolean lol = false;

void setup() {

  timePast = millis();
  timeInterval = 3000.0f;
  timePast0 = millis();
  timeInterval0 = 3000.0f;


  startup = new SoundFile(this, "startup.wav");

  map = new Map();
  player = new Player();
  mc = new MapCreator();
  sh = new SceneHandler();
  enemy = new Enemy[unit];
  block = new Block[unit];
  coin = new Coin[unit];
  launch = new LaunchPad[unit];

  runningRight = new PImage[2];
  runningLeft = new PImage[2];
  jumpingRight = new PImage[6];
  jumpingLeft = new PImage[6];
  goombaAlive = new PImage[2];

  mainFont = createFont("Impact", 40);
  gameOverFont = createFont("LCDMono2 Bold", 128);
  scoreFont  = createFont("LCDMono2 Bold", 40);
  menuFont = createFont("hooge 05_54", 60);

  goombaDead = loadImage("goombaDead.png");
  blockpng = loadImage("block.png");
  cloud = loadImage("cloud.png");
  sky = loadImage("sky.png");
  luckyblockpng = loadImage("lucky.png");
  coinpng = loadImage("coin.png");
  marioDead = loadImage("dead.png");
  smb = loadImage("smb.png");
  mush = loadImage("mushroom.png");
  finish = loadImage("finish.png");
  boostblock = loadImage("boostblock.png");

  loadTiles();
  fullScreen();
}

void draw() {
  sh.main();
}

void keyPressed() {
  if (!gameOver&& !gameFinish && gameState == "startGame") {
    if (key == 'd')
    {
      player.right = 1;
      player.direction = -1;
    }
    if (key == 'a')
    {
      player.left = -1;
      player.direction = 1;
    }

    if (key == 's') {
      player.down = -1;
    }
    if (key == ' ')
    {
      player.up = -1;
    }
  }
}

void keyReleased() {
  if (gameState == "GameFinish" || gameState == "GameOver") {
    background(0);
    delay(500);
    gameState = "menu";
  }
  if (!gameOver && !gameFinish && gameState == "startGame") {
    if (key == 'd')
    {
      player.right = 0;
    }
    if (key == 'a')
    {
      player.left = 0;
    }
    if (key == 's') {
      player.down = 0;
    }

    if (key == ' ')
    {
      player.up = 0;
    }
  }
  sh.keyReleased = true;
}


void loadTiles() {
  int w = (int) player.size.x;
  int h = (int) player.size.y;
  // load running right pimages
  for (int i = 0; i < runningRight.length; i++) {
    String filename = "runRight";
    runningRight[i] = loadImage(filename + i + ".png");
    runningRight[i].resize(w, h);
  }

  // load running left pimages
  for (int i = 0; i < runningLeft.length; i++) {
    String filename = "runLeft";
    runningLeft[i] = loadImage(filename + i + ".png");
    runningLeft[i].resize(w, h);
  }

  // load jumping left pimages
  for (int i = 0; i < jumpingLeft.length; i++) {
    String filename = "jumpLeft";
    jumpingLeft[i] = loadImage(filename + i + ".png");
    jumpingLeft[i].resize(w, h);
  }
  // load jumping right pimages
  for (int i = 0; i < jumpingRight.length; i++) {
    String filename = "jumpRight";
    jumpingRight[i] = loadImage(filename + i + ".png");
    jumpingRight[i].resize(w, h);
  }

  // load goomba alive pimages
  for (int i = 0; i < goombaAlive.length; i++) {
    String filename = "goomba";
    goombaAlive[i] = loadImage(filename + i + ".png");
    goombaAlive[i].resize(w, h);
    goombaDead.resize(w, h);
  }

  // load standing still pimages
  String filexname = "standingStill";
  standingStill= loadImage(filexname + ".png");
  standingStill.resize(w, h);
}

void resetKeys() {
  player.right = 3;
  player.left = 3;
  player.up = 3;
  player.down = 3;
}
