class Map {
  float mapLength;
  PVector size = new PVector();
  PVector pos = new PVector();
  // Constructor
  Map() {
    pos.x = 0;
    pos.y = height-100;
    size.x = 50;
    size.y = 50;

    mapLength = size.x;
  }

  void loadMap() {
    sky.resize(width, height);
    background(sky);
    image(cloud, width/2, height/2-300);
    image(cloud, width/2+400, height/2-500);
    image(cloud, width/2-600, height/2-550);
    
    fill(#35C14D);
    pos.x = -50;
    for (int i = 0; i < 100; i++) {
      image(blockpng, pos.x, pos.y);
   //   rect(pos.x, pos.y+50, size.x, size.y);
      pos.x+=50;
    }
    

  }
}
