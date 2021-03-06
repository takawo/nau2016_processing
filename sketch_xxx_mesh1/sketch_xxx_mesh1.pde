import megamu.mesh.*;

int num = 20;
float[][] points = new float[num][2];
float[][] speed = new float[num][2];

Delaunay myDelaunay;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < points.length; i++) {
    points[i][0] = random(width);
    points[i][1] = random(height);
    float theta = random(TWO_PI);
    speed[i][0] = sin(theta);
    speed[i][1] = cos(theta);
  }
  myDelaunay = new Delaunay( points );
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  for (int i = 0; i < points.length; i++) {
    points[i][0] += speed[i][0];
    points[i][1] += speed[i][1];
    strokeWeight(15);
    point(points[i][0], points[i][1]);

    if(points[i][0] < 0 || points[i][0] > width){
      speed[i][0] *= -1;
    }
    if(points[i][1] < 0 || points[i][1] > height){
      speed[i][1] *= -1;
    }

  }
  myDelaunay = new Delaunay( points );
  //float[][] myEdges = myDelaunay.getEdges();

  //for (int i=0; i<myEdges.length; i++)
  //{
  //  float startX = myEdges[i][0];
  //  float startY = myEdges[i][1];
  //  float endX = myEdges[i][2];
  //  float endY = myEdges[i][3];
  //  strokeWeight(1);
  //  line( startX, startY, endX, endY );
  //}
  int[][] myLinks = myDelaunay.getLinks();

  for (int i=0; i<myLinks.length; i++)
  {
    int startIndex = myLinks[i][0];
    int endIndex = myLinks[i][1];

    float startX = points[startIndex][0];
    float startY = points[startIndex][1];
    float endX = points[endIndex][0];
    float endY = points[endIndex][1];
    strokeWeight(3);
    line( startX, startY, endX, endY );
  }
}
