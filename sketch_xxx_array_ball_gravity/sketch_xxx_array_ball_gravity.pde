// 変数
int num = 100;
Ball[] balls = new Ball[num];
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // 色空間をHSBに
  background(0, 0, 0); // 背景を白に

  for(int i = 0; i < num; i++){
    balls[i] = new Ball(width/2,height/2);
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  //background(0,0,100);
  // 2.フレームごとに透明度の低い四角を描画することで、ボールの軌跡が描画される
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);

  for (int i = 0; i < num; i++) {
    balls[i].update();
    balls[i].display();
  }
}

// ボールのクラス
class Ball{
  // プロパティ
  float x; // x座標
  float y; // y座標
  float xStep; // x方向のスピード
  float yStep; // y方向のスピード
  float diameter; // 直径
  color c; // 色

  float gravity = 0.1;
  float friction = 0.998;
  // コンストラクタ
  Ball(float _x, float _y){
    x = _x;
    y = _y;
    xStep = random(-5,5);
    yStep = random(-5,5);
    diameter = random(10,30);
    c = color(random(360), 80, 100);
  }
  // アップデート関数：位置や色など更新
  void update(){
    // x座標にxStep(+5)を足す
    x += xStep;
    // y座標にyStep(+5)を足す
    y += yStep;
    yStep += gravity;
    xStep *= friction;
    yStep *= friction;

    // もしボールのx座標が画面の外に出た場合
    // x > width : x座標が画面の幅より大きい
    // x < 0 : x座標が0より小さい
    if (x > width || x < 0) {
      //x = constrain(x,0,width);
      xStep = xStep * -1; //xStepの方向を反転
      c = color(random(360), 80, 100);
    }
    // もしボールのyが画面の外に出た場合
    // y > height : y座標が画面の高さより大きい
    // y < 0 : y座標が0より小さい
    if (y > height || y < 0) {
      //y = constrain(y,0,height);
      yStep = yStep * -1; //yStepの方向を反転
      c = color(random(360), 80, 100);
    }
    x = constrain(x,0,width);
    y = constrain(y,0,height);

  }
  // ディスプレイ関数：表示
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,diameter,diameter);
  }
}
