// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); //ウィンドウサイズを960px,540pxに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  // 背景色を指定(R,G,B)
  background(255,255,255); //RGBは各0-255の数値で色を指定する

  // 線の色を指定
  stroke(0,128,255);

  // 線の太さを指定
  strokeWeight(10);

  // 楕円を描画
  ellipse(480,270,200,200); //x,y,幅,高さを指定
}
