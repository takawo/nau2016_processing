// ライブラリのインポート
import controlP5.*;

ControlP5 cp5; // UIライブラリControlP5のインスタンス
Button button; // ボタン

color bgColor;
color fillColor;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // カラーモードをHSBに

  cp5 = new ControlP5(this); // ControlP5の初期化

  // ControlP5にボタンのUIを追加
  // ControlP5はこんな風に命令を.で続けて書ける(メソッドチェーン)
  button = cp5.addButton("pushButton") //pushButton関数と紐付け
    .setLabel("Change Color") // ラベル：ボタンのタイトル
    .setSize(100, 40) // サイズ指定
    .setPosition(width/2-100/2, height-40/2-40); // 位置指定

  bgColor = color(0, 50, 100); // 色を白に
  fillColor = color(180, 80, 100); // 色を青に
}


void pushButton() {
  changeColor();
}

void changeColor() {
  float bgHue = random(360);
  float bgSaturation = random(50, 100);
  float bgBrightness = random(80, 100);

  bgColor = color(bgHue, bgSaturation, bgBrightness);

  float fillHue = (bgHue+180)%360;
  float fillSaturation = 100-bgSaturation;
  float fillBrightness = random(80, 100);
  println(fillHue);
  fillColor = color(fillHue, fillSaturation, fillBrightness);
}


// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(bgColor); // 背景色を白に指定
  noStroke(); // 線の色をナシに指定
  fill(fillColor); // 塗りつぶしの色を水色に

  // 円を描画(knobValueの値はノブを操作すると変化する)
  ellipse(width/2, height/2, 200, 200);
}