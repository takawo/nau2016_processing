// ライブラリのインポート
import controlP5.*;

ControlP5 cp5; // UIライブラリControlP5のインスタンス
Slider sliderX; // Sliderのインスタンス
Slider sliderY; // Sliderのインスタンス
ColorWheel colorWheel; // ColorWheelのインスタンス

float x; // x座標
float y; // y座標
float diameter; //直径

color fillColor; //描画色
color bgColor; //背景色（描画色の補色）

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // カラーモードをHSBに
  fillColor = color(random(360),80,100); // fillColorの値をランダムに
  cp5 = new ControlP5(this); // ControlP5の初期化

  // ControlP5にボタンのUIを追加
  // ControlP5はこんな風に命令を.で続けて書ける(メソッドチェーン)
  sliderX = cp5.addSlider("x") //変数xと紐付け
    .setLabel("x") // ラベル：ボタンのタイトル
    .setSize(200, 20) // サイズ指定
    .setRange(0, width) // スライダーの最小値と最大値を指定
    .setValue(width/2) // スライダーの初期値を指定
    .setPosition(40, 20); // 位置指定

  sliderY = cp5.addSlider("y") //変数xと紐付け
    .setLabel("y") // ラベル：ボタンのタイトル
    .setRange(0, height) // スライダーの最小値と最大値を指定
    .setValue(height/2) // スライダーの初期値を指定
    .setSize(200, 20) // サイズ指定
    .setPosition(40, 40); // 位置指定

    sliderY = cp5.addSlider("diameter") //変数diameterと紐付け
      .setLabel("diameter") // ラベル：ボタンのタイトル
      .setRange(0, 540) // スライダーの最小値と最大値を指定
      .setValue(200) // スライダーの初期値を指定
      .setSize(200, 20) // サイズ指定
      .setPosition(40, 60); // 位置指定

  colorWheel = cp5.addColorWheel("fillColor") // カラーホイールを追加しfillColorと紐付け
    .setPosition(40, 80); //位置指定

}



// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  bgColor = color((hue(fillColor)+180)%360,saturation(fillColor),brightness(fillColor));

  background(bgColor); // 背景色をbgColorに指定
  noStroke(); // 線の色をナシに指定
  fill(fillColor); // 塗りつぶしの色をfillColorに

  // 円を描画(x,yの値はsliderを操作すると変化する)
  ellipse(x, y, diameter, diameter);
}
