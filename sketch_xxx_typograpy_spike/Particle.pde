class Particle{
  PVector loc;
  PVector vel;
  float radius;
  float maxLife;
  float life;
  float lifeRate;
  color c;

  Particle(){
    init();
  }

  void init(){
    getPosition();
    float n = random(-1,1);
    vel = PVector.random2D();
    vel.mult(2);
    c = color(0,0,0,20);
    life = random(0.5,1);
    radius = random(1,3);
    maxLife = random(0.5,1.5);
    life = random(maxLife/2,maxLife);
    lifeRate = 0.03;
  }

  void getPosition(){
    while(loc == null || !isInText(loc)){
      loc = new PVector(random(width),random(height));
    }
  }

  void update(){
    float n = noise(loc.x/100f,loc.y/100f,frameCount*0.01);
    vel.rotate(map(n,0,1,-PI,PI));
    loc.add(vel);
    if (!isInText(loc)){
      lifeRate += 0.01;
    }
    life -= lifeRate;
    if(life < 0){
      init();
    }
  }

  void display(){
    pushStyle();
    colorMode(HSB,360,100,100,100);
    noStroke();
    fill(c);
    float r = map(life,0,maxLife,0,radius);
    ellipse(loc.x,loc.y,r,r);
    popStyle();
  }

  boolean isInText(PVector _loc){
    return graphic.get(int(_loc.x),int(_loc.y))== PGRAPHICS_COLOR;
  }
}
