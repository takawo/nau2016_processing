float r = 100;
PVector p1, p2, p3, p4;

void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  fill(220,80,100);
  p1 = new PVector(
    cos(radians(0))*r, 
    sin(radians(0))*r
    );
  p2 = new PVector(
    cos(radians(90))*(r*2), 
    sin(radians(90))*(r*2)
    );
  p3 = new PVector(
    cos(radians(180))*r, 
    sin(radians(180))*r
    );
  p4 = new PVector(
    cos(radians(270))*r, 
    sin(radians(270))*r
    );
}

void draw() {
  background(0,0,100);
  translate(width/2, height/2);

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
}