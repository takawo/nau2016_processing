
PImage img;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("animals-q-c-960-540-4.jpg");
  imageMode(CENTER);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, -300);
  rotateY(frameCount*0.005);
  rotateX(map(sin(frameCount*0.005), -1, 1, -PI/2-PI/6, -PI/2+PI/6));
  float r = 500;
  for (float angle = 0; angle < 360; angle += 15) {
    float theta = radians(angle);
    float x = cos(theta) * r;
    float y = sin(theta) * r;
    pushMatrix();
    translate(x, y);
    rotateZ(theta);
    rotateX(PI/2);
    rotateY(PI/2);
    //box(10);
    image(img,0,0,img.width/10,img.height/10);
    popMatrix();
  }
}