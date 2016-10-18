float a = 0;
int gridSize = 200;

void setup() {
  size(960, 540);
  rectMode(CENTER);
  noFill();
  stroke(255);
  smooth();
}

void draw() {
  background(0);
  for (int j =0; j < height+gridSize*2; j+=gridSize) {
    for (int i =0; i < width+gridSize*2; i+=gridSize) {
      
      pushMatrix();
      translate(i+gridSize/2, j+gridSize/2);
      rotate(radians(a));
      for (int d = gridSize-1; d > 0; d-= gridSize/10) {
        rect(0, 0, (d)*abs(sin(radians(a))),(d)*abs(sin(radians(a))));
      }
      popMatrix();
      
      pushMatrix();
      translate(i-gridSize, j-gridSize);
      rotate(radians(a));
      for (int d = gridSize-1; d > 0; d-= gridSize/10) {
        rect(0, 0, (d)*abs(cos(radians(a))),(d)*abs(cos(radians(a))));
      }
      popMatrix();
    }
  }
  a+=0.5;
}