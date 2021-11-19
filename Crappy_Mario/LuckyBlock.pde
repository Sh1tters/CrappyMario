class LuckyBlock {
  PVector pos = new PVector();
  PVector size = new PVector();
  
  LuckyBlock(float w, float h, float x, float y){
    this.pos.x = x;
    this.pos.y = y;
    this.size.x = w;
    this.size.y = h;
  }
  
  void update(){
    spawn();
  }
  
  void spawn(){
    int w = (int) size.x;
    int h = (int) size.y;
    luckyblockpng.resize(w, h);
    image(luckyblockpng, pos.x, pos.y);
  }
}
