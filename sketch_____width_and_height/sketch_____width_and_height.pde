
// width : ウィンドウの幅を格納するシステム変数
// height : ウィンドウの高さを格納するシステム変数
// Processing側で用意されているので特に何も宣言しなくても呼び出して使える

// 画面がフルスクリーンかどうか？
boolean isFullScreen = false;

// setup関数 : 初回1度だけ実行される
void setup() {

  settings(); // settings : フルスクリーンの指定をする場合は呼び出す必要がある

  // 画面の情報をコンソールに出力
  println("ウィンドウ幅(width) :" + width + "px");
  println("ウィンドウ幅(height):" + height + "px");
  println("画面幅(displayWidth) :" + displayWidth + "px");
  println("画面高さ(displayHeight) :" + displayHeight + "px");

  // ウィンドウサイズを変更可能にする
  surface.setResizable(true);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 背景色を指定(R,G,B)
  background(255, 255, 255); //RGBは各0-255の数値で色を指定する
  ellipse(width/2, height/2, 200, 200); //画面中央に200pxの円を描画
}

void settings() {
  fullScreen(); // フルスクリーンにする関数
}

void changeWindowSize(int w, int h) {
  surface.setSize(w, h);
  size(w, h);
}
