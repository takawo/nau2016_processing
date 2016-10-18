float x;
float y;
float xStep = 5;
float yStep = 5;
float size = 100;
color c;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // 色空間をHSBに  
  c = color(220, 80, 100); //ボールの色を青色に
  background(0, 0, 100); // 背景を白に
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 1.フレームごとに背景を塗りつぶした場合、ボールとして描画される
  //background(0,0,100);

  // 2.フレームごとに透明度の低い四角を描画することで、ボールの軌跡が描画される
  fill(0, 0, 100, 1);
  rect(0, 0, width, height);

  // 塗りつぶしの色を指定color型の変数c
  fill(c);
  // 線の色をナシに
  noStroke();
  // ボールを描画
  ellipse(x, y, size, size);
  // x座標にxStep(+5)を足す
  x += xStep;
  // y座標にyStep(+5)を足す
  y += yStep;

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
}