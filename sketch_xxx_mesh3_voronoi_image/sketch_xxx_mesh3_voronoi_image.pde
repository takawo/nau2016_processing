import megamu.mesh.*;

int num = 1000;
float[][] points = new float[num][2];
PImage img;
Voronoi myVoronoi;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(650, 715); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  textAlign(CENTER, CENTER);
  textSize(8);
  img = loadImage("http://radical-everyday.com/wp-content/uploads/2016/02/yume.jpg");
  for (int i =0; i < num; i++) {
    points[i][0] = 0 + random(0.01);
    points[i][1] = 0 + random(0.01);
  }
  pointsInit();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  if (mousePressed) {
    return;
  }
  image(img, 0, 0);
  MPolygon[] myRegions = myVoronoi.getRegions();
  for (int i=0; i<myRegions.length; i++) {
    float x = points[i][0] + +random(0.01);
    float y = points[i][1] + +random(0.01);
    color c = img.get((int)x, (int)y);
    // an array of points
    float[][] regionCoordinates = myRegions[i].getCoords();
    fill(c,100);
    noStroke();
    // stroke(0, 0, 50);
    myRegions[i].draw(this); // draw this shape
    //fill(0, 0, 0);
    //ellipse(x,y,20,20);
    //fill(0, 0, 100);
    //text(i, x, y);
  }
  noLoop();
}

void pointsInit() {
  int i = 0;
  while (i < num) {
    float x = random(width);
    float y = random(height);
    color c = img.get((int)x, (int)y);
    if (red(c) > 50 || blue(c) > 50 || green(c) > 50) {
      points[i][0] = x + random(0.01);
      points[i][1] = y + random(0.01);
      i++;
    }
  }
  if (i == num) {
    myVoronoi= new Voronoi(points);
  }
  delay(1000);
  background(0, 0, 100);
}

void mousePressed() {
  pointsInit();
  redraw();
}
