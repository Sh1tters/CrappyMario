class LaunchPad {
  PVector pos = new PVector();
  PVector size = new PVector();

  LaunchPad(float w, float h, float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
    this.size.x = w;
    this.size.y = h;
  }

  void update() {
    spawn();
  }

  void spawn() {
    fill(0);
    int w = (int) size.x;
    int h = (int) size.y;
      boostblock.resize(w, h);
    image(boostblock, pos.x, pos.y);
  }
}
