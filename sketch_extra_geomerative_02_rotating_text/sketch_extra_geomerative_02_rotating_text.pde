// geomerativeライブラリの読み込み
import geomerative.*;

//RShapeクラスのオブジェクト
RShape shape;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBの色空間を指定

  background(0, 0, 100);
  // geomerativeライブラリの初期化
  RG.init(this);
  // shapeにテキスト、フォント、フォントサイズ、行揃えを指定してインスタンス化
  shape = RG.getText("こんにちは、世界。", "GenShinGothic-P-Heavy.ttf", 72, CENTER);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100); // 背景を白色に
  fill(220, 80, 100); // 塗りつぶしを青色に
  stroke(0, 0, 0); // 線の色を黒色に
  strokeWeight(1); // 線の太さを指定

  translate(width/2, height/2); // 原点を画面中央に移動

  for (int i = 0; i < shape.children.length; i++) {
    if (frameCount==1) {
      shape.children[i].rotate(TWO_PI*((i*30f)/360f), shape.children[i].getCenter());
    }
    shape.children[i].rotate(PI/150, shape.children[i].getCenter());
  }

  shape.draw(); // テキストを描画
}