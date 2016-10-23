// 変数

int x = 0;
int loopX = 0;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); //カラーモードをHSBに
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  //H:0,S:0,B:100（彩度が0で明るさが100なので、色相に関係なく白）
  background(0, 0, 100);

  // 塗りつぶしの色を指定
  fill(60, 80, 100); // 黄色
  rect(x, 100, 150, 150); //矩形を描画

  // 塗りつぶしの色を指定
  fill(240, 80, 100); // 青色
  rect(loopX, 300, 150, 150); //矩形を描画

  // 加算の書き方
  x = x + 1; // xの値を1ずつ増やす
  // x = x + 1; は次のようにも書ける
  // x++;
  // x += 1;

  // 数値を繰り返す手法：剰余を使う
  loopX = loopX + 1; // loopXの値を1ずつ増やす
  // loopXが画面幅より出たとき0に戻す
  //（widthで割った余りが代入される）
  loopX = loopX%width;
}
