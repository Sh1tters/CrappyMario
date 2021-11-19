class Enemy {
  PVector pos = new PVector();
  PVector size = new PVector();
  int index = 1;

  Enemy(float xsize, float ysize, float xpos, float ypos) {
    size.x = xsize;
    size.y = ysize;
    pos.x = xpos;
    pos.y = ypos;
  }

  void update() {
    pos.x-=1;

    drawEnemy();
  }

  void drawEnemy() {
    image(enemypng, pos.x, pos.y);
    //    fill(#F51919);
    //  rect(pos.x, pos.y, size.x, size.y);
  }

  boolean blockCollision() {

    return false;
  }

  boolean playerIsDead() {
    if (player.pos.x + player.size.x > pos.x && player.pos.x < pos.x + size.x && player.pos.y + player.size.y > pos.y && player.pos.y < pos.y + size.y) { // collision side?
      return true;
    }
    return false;
  }
}
