// 変数の宣言

int num = 200; //ボールの数
float[] x = new float[num]; // xの配列の宣言
float[] y = new float[num]; // yの配列の宣言
float[] xStep = new float[num]; // xStepの配列の宣言
float[] yStep = new float[num]; // yStepの配列の宣言
float[] size = new float[num]; // sizeの配列の宣言
color[] c = new color[num]; // colorの配列の宣言
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // 色空間をHSBに

  // 配列にそれぞれ要素を代入して初期化
  for (int i = 0; i < num; i ++) {
    x[i] = width/2;
    y[i] = height/2;
    xStep[i] = random(-3, 3);
    yStep[i] = random(-3, 3);
    size[i] = random(30, 80);
    c[i] = color(random(360), 80, 100);
  }


  background(0, 0, 100); // 背景を白に
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 1.フレームごとに背景を塗りつぶした場合、ボールとして描画される
  //background(0,0,100);

  // 2.フレームごとに透明度の低い四角を描画することで、ボールの軌跡が描画される
  fill(0, 0, 100, 5);
  rect(0, 0, width, height);

  for (int i = 0; i < num; i ++) {
    // 塗りつぶしの色を指定color型の変数c
    fill(c[i]);
    // 線の色をナシに
    noStroke();
    // ボールを描画
    ellipse(x[i], y[i], size[i], size[i]);
    // x座標にxStep(+5)を足す
    x[i] += xStep[i];
    // y座標にyStep(+5)を足す
    y[i] += yStep[i];

    // もしボールのx座標が画面の外に出た場合
    // x > width : x座標が画面の幅より大きい
    // x < 0 : x座標が0より小さい
    if (x[i] > width || x[i] < 0) {
      //x[i] = constrain(x[i],0,width);
      xStep[i] = xStep[i] * -1; //xStepの方向を反転
      c[i] = color(random(360), 80, 100);
    }
    // もしボールのyが画面の外に出た場合
    // y > height : y座標が画面の高さより大きい
    // y < 0 : y座標が0より小さい
    if (y[i] > height || y[i] < 0) {
      //y[i] = constrain(y[i],0,height);
      yStep[i] = yStep[i] * -1; //yStepの方向を反転
      c[i] = color(random(360), 80, 100);
    }
  }
}