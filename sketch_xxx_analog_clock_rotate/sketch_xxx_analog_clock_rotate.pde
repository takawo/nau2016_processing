import gifAnimation.*;

GifMaker gifMaker;
float r = 200;
void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100);
  frameRate(60);
  textAlign(CENTER, CENTER);
  textSize(20);

  gifMaker = new GifMaker(this,"export.gif");
  gifMaker.setRepeat(0);
}

void draw() {
  int hour = hour();
  int minute = minute();
  int second = second();
  float hTheta = map(hour%12+minute/60f, 0.0, 12.0, 0-PI/2, TWO_PI-PI/2);
  float mTheta = map(minute+second/60f, 0.0, 60.0, 0-PI/2, TWO_PI-PI/2);
  float sTheta = map(second, 0, 60, 0-PI/2, TWO_PI-PI/2);
  background(0, 0, 100);
  pushMatrix();
  translate(width/2, height/2);
  float speed = radians(6)/60;
  rotate(-frameCount*speed);
  int i = 0;
  for (float theta = 0; theta < TWO_PI; theta += TWO_PI/60f) {
    if (i%5 == 0) {
      strokeWeight(5);
    } else {
      strokeWeight(2);
    }
    float x = cos(theta)*r;
    float y = sin(theta)*r;
    if (i%5 == 0 && i != 0) {
      //float x2 = cos(theta)*r*1.1;
      //float y2 = sin(theta)*r*1.1;
      fill(0, 0, 0);
      pushMatrix();
      translate(x, y);
      rotate(frameCount*speed);
      if ((i/5+3)%12 == 0) {
        text(12, 0, 0);
      } else {
        text((i/5+3)%12, 0, 0);
      }
      popMatrix();
    } else if (i != 0) {
      point(x, y);
    }
    i++;
  }
  strokeWeight(10);
  point(cos(hTheta)*r*0.5, sin(hTheta)*r*0.5);
  point(cos(mTheta)*r*0.8, sin(mTheta)*r*0.8);
  point(cos(sTheta)*r*0.9, sin(sTheta)*r*0.9);
  strokeWeight(20);
  point(0, 0);
  strokeWeight(3);
  line(0, 0, cos(hTheta)*r*0.5, sin(hTheta)*r*0.5);
  line(0, 0, cos(mTheta)*r*0.8, sin(mTheta)*r*0.8);
  line(0, 0, cos(sTheta)*r*0.9, sin(sTheta)*r*0.9);
  popMatrix();
  if (frameCount%10 == 0) {
    gifMaker.addFrame();
  }
  if (frameCount %300 == 0) {
    gifMaker.finish();
  }
}
