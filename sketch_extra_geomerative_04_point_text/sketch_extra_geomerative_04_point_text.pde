// geomerativeライブラリの読み込み
import geomerative.*;

//RShapeクラスのオブジェクト
RShape shape;
RPoint[] textPoints;
RPoint[] randomPoints;
RPoint[] currentPoints;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBの色空間を指定

  background(0, 0, 100);
  // geomerativeライブラリの初期化
  RG.init(this);
  // shapeにテキスト、フォント、フォントサイズ、行揃えを指定してインスタンス化
  shape = RG.getText("こんにちは、世界", "GenShinGothic-P-ExtraLight.ttf", 72, CENTER);
  // RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizer(RG.BYPOINT);
  RG.setPolygonizerLength(1);
  textPoints = shape.getPoints();
  randomPoints = new RPoint[textPoints.length];
  currentPoints = new RPoint[textPoints.length];
    for(int i = 0; i < textPoints.length; i++){
    randomPoints[i] = new RPoint(random(-width/2,width/2),random(-height/2,height/2));
  }
  arrayCopy(randomPoints,currentPoints);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100); // 背景を白色に
  strokeWeight(1); // 線の太さを指定

  translate(width/2, height/2); // 原点を画面中央に移動
  RG.setPolygonizer(RG.ADAPTATIVE);

  //shape.draw(); // テキストを描画
  fill(220, 80, 100); // 線の色を黒色に
  noStroke();
  for(int i = 0; i < randomPoints.length; i++){
    currentPoints[i].x = lerp(currentPoints[i].x,textPoints[i].x,0.01);
    currentPoints[i].y = lerp(currentPoints[i].y,textPoints[i].y,0.01);
    ellipse(currentPoints[i].x,currentPoints[i].y,1,1);
  }
  float distanceSum = 0;
  for(int i =0; i < currentPoints.length; i++){
    distanceSum += dist(currentPoints[i].x,currentPoints[i].y,textPoints[i].x,textPoints[i].y);
  }
  if(distanceSum < 1.0){
    for(int i = 0; i < textPoints.length; i++){
    randomPoints[i] = new RPoint(random(-width/2,width/2),random(-height/2,height/2));
  }
    arrayCopy(randomPoints,currentPoints);
  }
}
