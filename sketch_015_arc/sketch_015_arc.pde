// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(255, 255, 255); // 背景色を白に指定
  
  // 円弧の角度計算方法 0°と270°の指定方法
  float startAngle = 0;
  float endAngle = TWO_PI * 270/360;

  noFill(); // 塗りつぶしをナシに指定
  // 円弧の描画(x,y,width,height,startAngle,endAngle)
  arc(width*1/4, height/2, 200, 200, startAngle, endAngle);

  fill(0, 160, 255); // 塗りつぶしをナシに指定
  // 円弧の描画(x,y,width,height,startAngle,endAngle)
  arc(width*2/4, height/2, 200, 200, startAngle, endAngle, CHORD);


  fill(0, 128, 255); // 塗りつぶしを青に指定
  // 円弧の描画(x,y,width,height,startAngle,endAngle,form)
  arc(width*3/4, height/2, 200, 200, startAngle, endAngle, PIE);

  // 角度の指定方法と、
}