float grid = 10;
PImage img;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(512, 512, FX2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("lena_color.jpg");

  fill(0, 0, 10);
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  randomSeed(0);
  //background(0, 0, 0);
  for (float y = 0; y < width; y += grid) {
    for (float x = 0; x < width; x += grid) {
      pushMatrix();
      translate(x, y);
      color c = img.get(int(x), int(y));
      drawArc(c);
      popMatrix();
    }
  }
  //noLoop();
}

void mousePressed() {
  redraw();
}

void drawArc(color c) {
  fill(c);
  float brightness = brightness(c);
  float thickness = map(brightness, 0, 100, 0, grid/2);
  float random = ((1-random(1)) +(1-random(1)) +(1-random(1)) +(1-random(1)) +(1-random(1)))/5;
  int n = 1 + (int)(random* 4f);
  rotate(frameCount*map(brightness, 0, 100, 0.01, 0.1));
  switch(n) {
  case 0:
    break;
  case 1:
    pushMatrix();
    translate(0, grid);
    rotate(-PI/2);
    beginShape();
    for (float angle = 0; angle <= 90; angle++) {
      float theta = radians(angle);
      float x = cos(theta) * grid;
      float y = sin(theta) * grid;
      vertex(x, y);
    }
    for (float angle = 90; angle >= 0; angle--) {
      float theta = radians(angle);
      float x = cos(theta) * (grid - thickness);
      float y = sin(theta) * (grid - thickness);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    break;
  case 2:
    pushMatrix();
    translate(0, 0);
    rotate(0);
    beginShape();
    for (float angle = 0; angle <= 90; angle++) {
      float theta = radians(angle);
      float x = cos(theta) * grid;
      float y = sin(theta) * grid;
      vertex(x, y);
    }
    for (float angle = 90; angle >= 0; angle--) {
      float theta = radians(angle);
      float x = cos(theta) * (grid - thickness);
      float y = sin(theta) * (grid - thickness);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    break;
  case 3:
    pushMatrix();
    translate(grid, 0);
    rotate(PI/2);
    beginShape();
    for (float angle = 0; angle <= 90; angle+=5) {
      float theta = radians(angle);
      float x = cos(theta) * grid;
      float y = sin(theta) * grid;
      vertex(x, y);
    }
    for (float angle = 90; angle >= 0; angle-=5) {
      float theta = radians(angle);
      float x = cos(theta) * (grid - thickness);
      float y = sin(theta) * (grid - thickness);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    break;
  case 4:
    pushMatrix();
    translate(grid, grid);
    rotate(PI);
    beginShape();
    for (float angle = 0; angle <= 90; angle+=5) {
      float theta = radians(angle);
      float x = cos(theta) * grid;
      float y = sin(theta) * grid;
      vertex(x, y);
    }
    for (float angle = 90; angle >= 0; angle-=5) {
      float theta = radians(angle);
      float x = cos(theta) * (grid - thickness);
      float y = sin(theta) * (grid - thickness);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    break;
  }
}