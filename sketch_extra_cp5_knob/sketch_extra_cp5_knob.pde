// ライブラリのインポート
import controlP5.*;

ControlP5 cp5; // UIライブラリControlP5のインスタンス
Knob knob; // ノブ(ツマミ)
int knobValue; // ノブの値

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // カラーモードをHSBに
  
  cp5 = new ControlP5(this); // ControlP5の初期化
  
  // ControlP5にノブのUIを追加
  // ControlP5はこんな風に命令を.で続けて書ける(メソッドチェーン)
  knob = cp5.addKnob("knobValue")
    .setRange(100, 540) // 範囲の指定
    .setValue(350) // 初期値の指定
    .setPosition(width/2-50, height/2-50) // 位置の指定
    .setRadius(50) // 半径の指定
    .setDragDirection(Knob.HORIZONTAL); // ドラッグして数値が変化する方向を水平方向に指定
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100); // 背景色を白に指定
  noStroke(); // 線の色をナシに指定
  fill(220, 50, 100); // 塗りつぶしの色を水色に
  
  // 円を描画(knobValueの値はノブを操作すると変化する)
  ellipse(width/2, height/2, knobValue, knobValue);
}