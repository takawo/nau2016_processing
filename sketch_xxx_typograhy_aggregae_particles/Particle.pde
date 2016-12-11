class Particle{
  PVector loc;
  PVector vel;
  float radius = 10;
  float life = random(1,3);
  float lifeRate = 0.03;

  Particle(){
    getPosition();
    vel = PVector.random2D();
  }

  void getPosition(){
    while(loc == null || !isInText(loc)){
      loc = new PVector(random(width),random(height));
    }
  }

  void update(){
    vel.rotate(random(-TWO_PI/20,TWO_PI/20));
    loc.add(vel);
    switch(mode){
      case 0:
      if (!isInText(loc)){
        getPosition();
      }
      break;
      case 1:
      life -= lifeRate;
      radius *= 0.95;
      break;
      case 2:
      if (!isInText(loc)){
        getPosition();
      }
      life -= lifeRate;
      radius *= 0.95;
      break;
    }
  }

  void display(){
    pushStyle();
    colorMode(HSB,360,100,100,100);
    fill(0,0,100);
    stroke(0,0,0,50);
    float r  = radius;
    switch(mode){
      case 0:
      break;
      case 1:
      break;
      case 2:
      break;
    }
    ellipse(loc.x,loc.y,r,r);
    popStyle();
  }

  boolean isInText(PVector _loc){
    return pg.get(int(_loc.x),int(_loc.y))== PGRAPHICS_COLOR;
  }
}
