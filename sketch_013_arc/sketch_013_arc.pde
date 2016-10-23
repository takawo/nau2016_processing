// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); //ウィンドウサイズを960px,540pxに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 背景色を指定(R,G,B)
  background(255, 255, 255); //RGBは各0-255の数値で色を指定する

  // 塗りつぶしをナシに
  noFill();

  // 円弧を描画 x,y,diameter diameter,startAngle,endAngle
  arc (240, 270, 300, 300, 0, TWO_PI * 270/360);

  // 塗りつぶしを青に
  fill(0, 128, 255);

  // 円弧を描画 x,y,diameter diameter,startAngle,endAngle, PIEで円グラフのチャートのように描画
  arc (720, 270, 300, 300, 0, TWO_PI * 270/360, PIE);
}
