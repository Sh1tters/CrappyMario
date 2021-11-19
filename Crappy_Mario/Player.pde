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
    pos.y = height - 100;
  }

  void updatePlayer() {
    // Only apply gravity if above ground (since y positive is down we use < ground) & apply gravity if were not standing on a block
    if (pos.y < ground)
    {
      velocity.y += gravity;
    } else
    {
      velocity.y = 0;
    }

    blockCollision();
    luckyblockCollision();

    // If the player is under the ground
    if (pos.y > ground) pos.y = ground;


    // If on the ground and "jump" keyy is pressed set my upward velocity to the jump speed!
    if (pos.y >= ground && up != 0)
    {
      velocity.y = -jumpSpeed;
    }

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

    drawPlayer();

    // You can iterate over an ArrayList in two ways.
    // The first is by counting through the elements:
    for (int i = 0; i < enemys.size(); i++) {
      Enemy enemy = enemys.get(i);
    }
  }

  void drawPlayer() {
    int w = (int) size.x;
    int h = (int) size.y;
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


  void playerAnimation() {
    if (!gameOver) {
      if (isPlayerInAir()) {
        if (left != 0) image(jumpingLeft[4], pos.x, pos.y);
        else if (right != 0) image(jumpingRight[4], pos.x, pos.y);
        else image(jumpingRight[4], pos.x, pos.y);
      } else if (isPlayerRunningRight()) {
        image(runningRight[frameCount%2], pos.x, pos.y);
      } else if (isPlayerRunningLeft()) {
        image(runningLeft[frameCount%2], pos.x, pos.y);
      } else if (isPlayerStandingStill()) {
        image(standingStill, pos.x, pos.y);
      }
    } else {
      image(marioDead, pfreezex, pfreezey + 20);
    }
  }

  void luckyblockCollision() {
    // Check collision with lucky blocks on map and don't move if hitting a block

    //BUG: Cannot jump when on the block
    //BUG: Jumping from bottom to top, makes you teleport to the top instead of a collision.
    for (int i = 0; i < luckyblocks.size(); i++) {
      LuckyBlock bl = luckyblocks.get(i);
      if (onSideBlockCollision(pos.x, pos.y, size.x, size.y, bl.pos.x, bl.pos.y, bl.size.x, bl.size.y)) {
        if (pos.y + size.y >= bl.pos.y) { // jump from top to bottom
          // remove gravity
          velocity.y = 0;
          // make player stand on block
          pos.y = bl.pos.y - size.y;
        }
        if (pos.y + size.y == bl.pos.y && up != 0) {
          velocity.y = -jumpSpeed;
        }

        if (pos.y + size.y == bl.pos.y && down != 0) {
          velocity.y += gravity;
        }
      }
    }
  }


  void blockCollision() {
    // Check collision with blocks on map and don't move if hitting a block

    //BUG: Cannot jump when on the block
    //BUG: Jumping from bottom to top, makes you teleport to the top instead of a collision.
    for (int i = 0; i < blocks.size(); i++) {
      Block bl = blocks.get(i);
      if (onSideBlockCollision(pos.x, pos.y, size.x, size.y, bl.pos.x, bl.pos.y, bl.size.x, bl.size.y)) {
        if (pos.y + size.y >= bl.pos.y) { // jump from top to bottom
          // remove gravity
          velocity.y = 0;
          // make player stand on block
          pos.y = bl.pos.y - size.y;
        }
        if (pos.y + size.y == bl.pos.y && up != 0) {
          velocity.y = -jumpSpeed;
        }

        if (pos.y + size.y == bl.pos.y && down != 0) {
          velocity.y += gravity;
        }
      }
    }
  }


  void freezePlayer() {
    pos.x = pfreezex;
    pos.y = pfreezey;
  }
}
