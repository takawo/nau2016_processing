
class Mover {
  float r = 50;
  PVector loc;
  PVector vel;
  float angle;
  float amp1, amp2;
  PVector p1, p2, p3, p4;
  color c;

  Mover(float x, float y, float r) {
    loc = new PVector(x, y);
    vel = new PVector(random(-.5, .5), random(-.5, .5));
    this.r = r;
    amp1 = random(0.01, 0.1);
    amp2 = random(0.01, 0.1);
    c = color(random(100,180),random(40,80),80);
  }
  void update() {
    loc.add(vel);
    println(angle);
    if(loc.x < 0 || loc.x > width){
      vel.x *= -1;
    }
    if(loc.y < 0 || loc.y > height){
      vel.y *= -1;
    }
  }
  boolean equals(Mover m){
    return loc.equals(m.loc);
  }
  float calDist(Mover m){
    return dist(loc.x,loc.y,m.loc.x,m.loc.y);
  }

  void draw() {
    fill(c);
    pushMatrix();
    translate(loc.x, loc.y);
    angle = atan2(vel.y, vel.x)+PI/2;
    rotate(angle);
    p1 = new PVector(
      cos(radians(0))*map(noise(vel.x,frameCount*amp1), 0, 1, r/2, r), 
      sin(radians(0))*r
      );
    p2 = new PVector(
      cos(radians(90))*(r*2), 
      sin(radians(90))*(map(noise(vel.y,frameCount*amp2), 0, 1, r/2, r)*2)
      );
    p3 = new PVector(
      cos(radians(180))*map(noise(vel.x,frameCount*amp1), 0, 1, r/2, r), 
      sin(radians(180))*r
      );
    p4 = new PVector(
      cos(radians(270))*r, 
      sin(radians(270))*r
      );

    //  fill(0, 0, 100);
    //  ellipse(p1.x, p1.y, 3, 3);
    //  ellipse(p2.x, p2.y, 3, 3);
    //  ellipse(p3.x, p3.y, 3, 3);
    //  ellipse(p4.x, p4.y, 3, 3);

    //  fill(0, 0, 0);
    //  ellipse(p1.x, p1.y-r/2, 3, 3);
    //  ellipse(p1.x, p1.y+r/2, 3, 3);
    //  ellipse(p2.x-r/2, p2.y, 3, 3);
    //  ellipse(p2.x+r/2, p2.y, 3, 3);
    //  ellipse(p3.x, p3.y-r/2, 3, 3);
    //  ellipse(p3.x, p3.y+r/2, 3, 3);
    //  ellipse(p4.x-r/2, p4.y, 3, 3);
    //  ellipse(p4.x+r/2, p4.y, 3, 3);


    //  noFill();
    beginShape();
    vertex(p1.x, p1.y);
    bezierVertex(
      p1.x, p1.y+r/2, 
      p2.x+r/2, p2.y, 
      p2.x, p2.y
      );
    bezierVertex(
      p2.x-r/2, p2.y, 
      p3.x, p3.y+r/2, 
      p3.x, p3.y
      );
    bezierVertex(
      p3.x, p3.y-r/2, 
      p4.x-r/2, p4.y, 
      p4.x, p4.y
      );
    bezierVertex(
      p4.x+r/2, p4.y, 
      p1.x, p1.y-r/2, 
      p1.x, p1.y
      );
    endShape(CLOSE);
    popMatrix();
  }
}