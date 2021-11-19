class JumpBoostBlock {

  PVector pos = new PVector();
  PVector size = new PVector();

  JumpBoostBlock(float w, float h, float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
    this.size.x = w;
    this.size.y = h;
  }

  void update() {
    spawn();
  }

  void spawn() {
  }
}
