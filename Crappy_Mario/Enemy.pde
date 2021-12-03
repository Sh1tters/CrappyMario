public float efreezex, efreezey;

class Enemy {
  PVector pos = new PVector();
  PVector size = new PVector();
  int index = 1;
  float xspeed = random(3, 6);

  boolean dead = false;

  Enemy(float xsize, float ysize, float xpos, float ypos) {
    size.x = xsize;
    size.y = ysize;
    pos.x = xpos;
    pos.y = ypos;
  }

  void update() {
    drawGoomba();

    pos.x += xspeed;
    for (int i = 0; i < blocks.size(); i++) {
      Block bl = blocks.get(i);
      if (pos.x > bl.pos.x - 50 && pos.y == bl.pos.y || pos.x - 100> bl.pos.x - 50 && pos.y == bl.pos.y) {
        xspeed *=-1;
      }
    }
    if (pos.x < 0 || pos.x > width) {
      xspeed *= -1;
    }
    
    if(pos.y < player.ground){
       pos.y += 1; 
    }
  }


  void drawGoomba() {
    for (int i = 0; i < goombaAlive.length; i++) {
      int w = (int) size.x;
      int h = (int) size.y;
      goombaAlive[i].resize(w, h);
    }

    for (int i = 0; i < enemys.size(); i++) {
      Enemy e = enemys.get(i);
      RectangleSide collisionSide = goombaIsDead(e.pos.x, e.pos.y, e.size.x, e.size.y);
      if (collisionSide == null || collisionSide == RectangleSide.RIGHT || collisionSide == RectangleSide.LEFT) {
        image(goombaAlive[(frameCount / 3) % goombaAlive.length], pos.x, pos.y);
        if (collisionSide == RectangleSide.RIGHT || collisionSide == RectangleSide.LEFT) {
          pfreezex = player.pos.x;
          pfreezey = player.pos.y;
          efreezex = pos.x;
          efreezey = pos.y;
          gameOver = true;
          gameFinish = false;
          totalscoreSession += score;
        }
      } else {
        player.velocity.y = -player.jumpSpeed;
        score += random(100, 700);
        image(goombaDead, pos.x, pos.y + 10);
        enemys.remove(i);
      }
    }
  }



  public RectangleSide goombaIsDead(float x, float y, float w, float h) {
    RectangleSide side = null;

    float dx = (player.pos.x + player.size.x / 2) - (x + w / 2);
    float dy = (player.pos.y + player.size.y / 2) - (y + h / 2);
    float width = (player.size.x + w) / 2;
    float height = (player.size.y + h) / 2;
    float crossWidth = width * dy;
    float crossHeight = height * dx;

    //It works by checking if the 2 rectangles centers are close enough to be colliding
    //if so check the intersection depths to determine which side was most involved in the collision

    if (abs(dx) <= width && abs(dy) <= height) {
      boolean c = crossWidth > -crossHeight;
      if (crossWidth > crossHeight) { //either bottom or left
        side = c ? RectangleSide.BOTTOM : RectangleSide.LEFT;
      } else {
        side = c ? RectangleSide.RIGHT : RectangleSide.TOP;
      }
    }

    return side;
  }

  void freezeEnemies() {
    for (int i = 0; i < enemys.size(); i++) {
      Enemy e = enemys.get(i);
      e.pos.x = efreezex;
      e.pos.y = efreezey;
    }
  }
}

private enum RectangleSide {
  BOTTOM, LEFT, RIGHT, TOP;
}
