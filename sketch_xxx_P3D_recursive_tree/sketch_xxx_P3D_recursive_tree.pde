import controlP5.*;

ControlP5 cp5;
float h;
float theta;
float sw = 0.5;
float amp = 0.66;

void setup() {
  size(960, 540, P3D);
  colorMode(HSB, 360, 100, 100);
  frameRate(60);
  stroke(0, 0, 100);
  cp5 = new ControlP5(this);
  cp5.addSlider("theta")
    .setRange(-PI, PI)
    .setValue(0)
    .setPosition(20, 20);

  cp5.addSlider("h")
    .setRange(0, 400)
    .setValue(200)
    .setPosition(20, 40);

  cp5.addSlider("amp")
    .setRange(0, 0.7)
    .setValue(0.66)
    .setPosition(20, 60);
}

void draw() {
  background(0, 0, 0);
  lights();
  cp5.draw();
  pushMatrix();
  translate(width/2, height, -500);
  rotateY(frameCount*0.01);
  rotateX(-0.15);
  rotateZ(0.00);
  strokeWeight(sw);
  box(50);
  line(0, 0, 0, -h);
  translate(0, -h);
  branch(h);
  popMatrix();
}

void branch(float h) {
  h *= amp;
  if (h > 20 && sw > 0) {
    pushMatrix();
    rotateZ(theta);
    strokeWeight(sw);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();

    pushMatrix();
    rotateX(-theta);
    strokeWeight(sw);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();

    pushMatrix();
    rotateX(theta);
    strokeWeight(sw);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();

    pushMatrix();
    rotateY(-theta);
    strokeWeight(sw);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();

    pushMatrix();
    rotateY(theta);
    strokeWeight(sw);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();

    pushMatrix();
    rotateZ(-theta);
    strokeWeight(sw);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
