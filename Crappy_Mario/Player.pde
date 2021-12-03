public float pfreezex, pfreezey;

class Player {
  PVector pos = new PVector();
  PVector size = new PVector();
  float sizex;
  // half a pixel per frame gravity
  float gravity = .5;

  // Y coordinate of ground for collision
  float ground = height - 150;

  PVector velocity = new PVector(0, 0);
  float jumpSpeed = 10;
  float walkSpeed = 4;
  float left, right, up, down, direction = 1;


  Player() {
    size.x = 50;
    size.y = 50;
    sizex = size.y;
    pos.x = 100;
    pos.y = height - 300;
  }

  void updatePlayer() {
    if (pos.y < ground) {
      velocity.y += gravity;
    } else
    {
      velocity.y = 0;
    }
    blockCollision();
    launchpadCollision();

    // Wlak left and right.
    velocity.x = walkSpeed * (left + right);

    // We check the nextpos before actually setting the pos so we can
    // not move the rect if its colliding.
    PVector nextpos = new PVector(pos.x, pos.y);
    nextpos.add(velocity);

    // Check collision with edge of screen and don't move if at the edge
    float offset = 0;
    if (nextpos.x > offset && nextpos.x < (width - offset))
    {
      pos.x = nextpos.x;
    }
    if (nextpos.y > offset && nextpos.y < (height - offset))
    {
      pos.y = nextpos.y;
    }
    if (pos.x > 1910) {
      gameFinish = true;
      gameOver = false;
      gameState = "GameFinish";
    }

    drawPlayer();
  }

  void drawPlayer() {
    playerAnimation();
  }

  boolean isPlayerStandingStill() {
    if (left == 0 && right == 0 && down == 0 && up == 0) {
      // standing still
      return true;
    }
    return false;
  }

  boolean isPlayerRunningLeft() {
    if (left != 0 && up == 0) {
      // running left
      return true;
    }
    return false;
  }

  boolean isPlayerRunningRight() {
    if (right != 0 && up == 0) {
      // running right
      return true;
    }
    return false;
  }

  boolean isPlayerJumping() {
    if (up != 0) {
      // jumping
      return true;
    }
    return false;
  }


  boolean onSideBlockCollision(float px, float py, float pw, float ph, float bx, float by, float bw, float bh) {
    if (px + pw >= bx &&
      px <= bx + bw &&
      py + ph >= by &&
      py <= by + bh) {
      return true;
    }
    return false;
  }


  boolean onBlockCollision(float px, float pw, float bx, float bw) {
    if (px + pw >= bx &&
      px <= bx + bw) {
      return true;
    }
    return false;
  }

  boolean isPlayerInAir() {
    for (int i = 0; i < blocks.size(); i++) {
      Block bl = blocks.get(i);
      if (pos.y < ground) { // above ground?
        if (pos.y + size.y == bl.pos.y) { // make sure not on a block
        } else return true;
      }
    }
    return false;
  }

  boolean isPlayerOnBlock() {
    for (int i = 0; i < blocks.size(); i++) {
      Block bl = blocks.get(i);
      if (pos.y + size.y == bl.pos.y) { // make sure not on a block
        return true;
      }
    }
    return false;
  }


  void playerAnimation() {
    if (!gameOver) {
      if (isPlayerInAir()) {
        if (left != 0) image(jumpingLeft[4], pos.x, pos.y);
        else if (right != 0) image(jumpingRight[4], pos.x, pos.y);
        else image(jumpingRight[4], pos.x, pos.y);
      } else if (isPlayerRunningRight()) {
        image(runningRight[(frameCount / 4) % runningRight.length], pos.x, pos.y);
      } else if (isPlayerRunningLeft()) {
        image(runningLeft[(frameCount / 4) % runningLeft.length], pos.x, pos.y);
      } else if (isPlayerStandingStill()) {
        image(standingStill, pos.x, pos.y);
      }
    } else {
      image(marioDead, pfreezex, pfreezey + 20);
    }
  }

  void blockCollision() {
    for (int i = 0; i < blocks.size(); i++) {
      Block bl = blocks.get(i);
      BlockSide collisionSide = blockCol(bl.pos.x, bl.pos.y, bl.size.x, bl.size.y);

      if (collisionSide == BlockSide.TOP) {
        velocity.y = 0;
        pos.y = bl.pos.y - bl.size.y;
        // If on the ground and "jump" keyy is pressed set my upward velocity to the jump speed!
        if (up != 0)
        {
          velocity.y = -jumpSpeed;
        }
      } else if (collisionSide == BlockSide.RIGHT) {
        pos.x = pos.x+5;
        if (sh.levelSelected == 9) {
          velocity.y = 5;
        }
      } else if (collisionSide == BlockSide.LEFT) {
        pos.x = pos.x - 5;
        if (sh.levelSelected == 9) {
          velocity.y = 5;
        }
      } else if (collisionSide == BlockSide.BOTTOM) {
        pos.y = pos.y + 5;
      }
    }
  }

  public BlockSide blockCol(float x, float y, float w, float h) {
    BlockSide side = null;

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
        side = c ? BlockSide.BOTTOM : BlockSide.LEFT;
      } else {
        side = c ? BlockSide.RIGHT : BlockSide.TOP;
      }
    }

    return side;
  }


  void launchpadCollision() {
    for (int i = 0; i < launchs.size(); i++) {
      LaunchPad bl = launchs.get(i);
      BlockSide collisionSide = blockCol(bl.pos.x, bl.pos.y, bl.size.x, bl.size.y);

      if (collisionSide == BlockSide.TOP) {
        velocity.y = 0;
        pos.y = bl.pos.y - bl.size.y;
        velocity.y = -30;
      } else if (collisionSide == BlockSide.RIGHT) {
        pos.x = pos.x+5;
      } else if (collisionSide == BlockSide.LEFT) {
        pos.x = pos.x - 5;
      } else if (collisionSide == BlockSide.BOTTOM) {
        pos.y = pos.y + 5;
        velocity.y = 30;
      }
    }
  }


  void freezePlayer() {
    pos.x = pfreezex;
    pos.y = pfreezey;
  }

  void unfreezePlayer() {
    pos.x = pos.x;
    pos.y = pos.y;
  }
}
private enum BlockSide {
  BOTTOM, LEFT, RIGHT, TOP;
}
