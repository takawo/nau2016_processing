// geomerativeライブラリの読み込み
import geomerative.*;

//RShapeクラスのオブジェクト
RShape shape;
RPoint[] points;

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
  noFill();
  stroke(220, 80, 100); // 線の色を黒色に
  strokeWeight(1); // 線の太さを指定

  translate(width/2, height/2); // 原点を画面中央に移動
  RG.setPolygonizer(RG.ADAPTATIVE);

  shape.draw(); // テキストを描画

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  points = shape.getPoints();

  // If there are any points
  if (points != null) {
    noFill();
    stroke(0, 200, 0);
    beginShape();
    for (int i=0; i<points.length; i++) {
      vertex(points[i].x, points[i].y);
    }
    endShape();

    fill(0);
    stroke(0);
    for (int i=0; i<points.length; i++) {
      ellipse(points[i].x, points[i].y, 5, 5);
    }
  }
}
