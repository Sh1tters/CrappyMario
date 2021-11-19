class Block {
  PVector pos = new PVector();
  PVector size = new PVector();

  Block(float w, float h, float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
    this.size.x = w;
    this.size.y = h;
  }
  
  void update(){
    spawn();
  }
  
  void spawn(){
    fill(0);
    int w = (int) size.x;
    int h = (int) size.y;
    blockpng.resize(w, h);
    image(blockpng, pos.x, pos.y);
//    rect(pos.x, pos.y, size.x, size.y);
  }
}
