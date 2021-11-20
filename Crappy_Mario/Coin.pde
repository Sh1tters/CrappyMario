class Coin {
  PVector pos = new PVector();
  PVector size = new PVector();

  Coin(float w, float h, float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
    this.size.x = w;
    this.size.y = h;
  }


  void update() {
    spawn();

    playerCollision();
  }

  void spawn() {
    int w = (int) size.x;
    int h = (int) size.y;
    coinpng.resize(w, h);
    image(coinpng, pos.x, pos.y);
  }

  void playerCollision() {
    for (int i = 0; i < coins.size(); i++) {
      Coin c = coins.get(i);
      if (player.onSideBlockCollision(player.pos.x, player.pos.y, player.size.x, player.size.y, c.pos.x, c.pos.y, c.size.x, c.size.y)) {
        score += random(100,200);
        coins.remove(i);
        collected_coins+=1;
      }
    }
  }
}
