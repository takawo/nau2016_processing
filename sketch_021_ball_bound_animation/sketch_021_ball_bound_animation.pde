// 変数
int num = 50; // 以下用意する配列の要素数
float x[] = new float[num]; // ボールのx座標の配列
float y[] = new float[num]; // ボールのy座標の配列
float xStep[] = new float[num]; // ボールのx方向のスピード
float yStep[] = new float[num]; // ボールのy方向のスピード
float diameter[] = new float[num]; // ボールの大きさ
color c[] = new color[num]; // ボールの色

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // 色空間をHSBに
  background(0, 0, 0); // 背景を白に
  for (int i = 0; i < num; i++) {
    x[i] = random(width);
    y[i] = random(height);
    xStep[i] = random(-1, 1)*5;
    yStep[i] = random(-1, 1)*5;
    diameter[i] = random(10,30);
    c[i] = color(random(360), 80, 100);
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  //background(0,0,100);

  // 2.フレームごとに透明度の低い四角を描画することで、ボールの軌跡が描画される
  fill(0, 0, 0, 1);
  rect(0, 0, width, height);

  for (int i = 0; i < num; i++) {
    // 塗りつぶしの色を指定color型の変数c
    fill(c[i]);
    // 線の色をナシに
    noStroke();
    // ボールを描画
    ellipse(x[i], y[i], diameter[i], diameter[i]);
    // x座標にxStep(+5)を足す
    x[i] += xStep[i];
    // y座標にyStep(+5)を足す
    y[i] += yStep[i];

    // もしボールのx座標が画面の外に出た場合
    // x > width : x座標が画面の幅より大きい
    // x < 0 : x座標が0より小さい
    if (x[i] > width || x[i] < 0) {
      //x = constrain(x,0,width);
      xStep[i] = xStep[i] * -1; //xStepの方向を反転
      c[i] = color(random(360), 80, 100);
    }
    // もしボールのyが画面の外に出た場合
    // y > height : y座標が画面の高さより大きい
    // y < 0 : y座標が0より小さい
    if (y[i] > height || y[i] < 0) {
      //y = constrain(y,0,height);
      yStep[i] = yStep[i] * -1; //yStepの方向を反転
      c[i] = color(random(360), 80, 100);
    }
  }
}
