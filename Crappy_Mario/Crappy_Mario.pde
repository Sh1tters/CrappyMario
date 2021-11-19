Map map;
Player player;
Enemy[] enemy;
Block[] block;
LuckyBlock[] luckyblock;
int unit = 3;
ArrayList<Enemy> enemys = new ArrayList<Enemy>();
ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<LuckyBlock> luckyblocks = new ArrayList<LuckyBlock>();

PImage blockpng, cloud, sky, luckyblockpng, enemypng, standingStill;
PImage[] runningLeft, runningRight, jumping;


void setup() {
  fullScreen();

  map = new Map();
  player = new Player();
  enemy = new Enemy[unit];
  block = new Block[unit];
  luckyblock = new LuckyBlock[unit];

  runningRight = new PImage[2];
  runningLeft = new PImage[2];

  blockpng = loadImage("block.png");
  cloud = loadImage("cloud.png");
  sky = loadImage("sky.png");
  luckyblockpng = loadImage("lucky.png");
  enemypng = loadImage("enemy.png");

  loadTiles();

  for (int i = 0; i < unit; i++)
  {
    // enemy[i] = new Enemy(50, 50, random(200, width-100), height-100);
    // Objects can be added to an ArrayList with add()
    enemys.add(new Enemy(50, 50, random(200, width-100), height-150));
  }

  // testing blocks class
  fill(0);
  for (int i = 0, x = 300; i < 5; i++) {
    blocks.add(new Block(50, 50, x, 850));
    x = x + 50;
  }

  // testing lucky blocks
  luckyblocks.add(new LuckyBlock(50, 50, 600, 850));
}

void draw() {
  smooth();
  map.loadMap();
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

  textSize(10);
  fill(0);
  text("Enemies: "+enemys.size(), 20, 20);
  text("Blocks: " + blocks.size(), 20, 40);
  text("Map Length: "+map.mapLength, 20, 60);
  text("Frames: "+frameRate, 20, 80);
  text("Player X,Y: " + player.pos.x + "," + player.pos.y, 20, 100);
  text("Lucky Blocks: " + luckyblocks.size(), 20, 120);
}

void keyPressed() {

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

void keyReleased() {

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

  // load standing still pimages
  String filename = "standingStill";
  standingStill= loadImage(filename + ".png");
  standingStill.resize(w, h);
}
