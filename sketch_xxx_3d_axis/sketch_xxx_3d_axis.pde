void setup() {
  size(960, 540, P3D);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  background(0, 0, 0);
  lights();
  pushMatrix();
  translate(width/2, height/2, -300);
  fill(0,0,50);
  sphere(30);
  rotateY(frameCount*0.01);
  rotateZ(frameCount*0.005);
  rotateX(frameCount*0.001);
  pushMatrix();
  fill(0, 100, 100);
  translate(150, 0, 0);
  box(300, 10, 10);
  translate(200, 0, 0);
  rotateZ(PI/2);
  drawCylinder(0, 30, 50, 3);
  popMatrix();
  pushMatrix();
  fill(120, 100, 100);
  translate(0, 150, 0);
  box(10, 300, 10);
  translate(0, 200, 0);
  rotateX(-PI);
  drawCylinder(0, 30, 50, 3);
  popMatrix();
  pushMatrix();
  fill(240, 100, 100);
  translate(0, 0, 150);
  box(10, 10, 300);
  translate(0, 0, 200);
  rotateX(-PI/2);
  drawCylinder(0, 30, 50, 3);
  popMatrix();
  popMatrix();
}

void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();

  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}
