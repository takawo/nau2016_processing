int num = 100;
Mover m;
ArrayList<Mover> movers = new ArrayList<Mover>(); 

void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  for (int i = 0; i < num; i++) {
    m = new Mover(random(width), random(height), 10);
    movers.add(m);
  }
}

void draw() {
  background(0, 0, 100);
  for (Mover m : movers) {
    m.update();
    m.draw();
    for(Mover m2 : movers){
      if(m.equals(m2) != true){
        float dist = m.calDist(m2);
        if(dist < 10*2){
          m.vel.mult(-1);
          m2.vel.mult(-1);
        }
      }
    }
  }
}