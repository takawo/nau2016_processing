// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,100); // 背景の描画
  noFill(); // 塗りつぶしをナシに
  stroke(0,0,0);
  line(width/2,0,width/2,height); // グラフの描画
  line(0,height/2,width,height/2); // グラフの描画
  translate(width/2,height/2); //原点位置の移動
  ellipse(0,0,400,400); //円を描画

  // 原点（画面中心から観たマウス位置の角度を計算）
  float theta = atan2(mouseY-height/2,mouseX-width/2);

  // 円周上の点の計算
  float x = cos(theta)* 200;
  float y = sin(theta)* 200;
  float t = tan(theta)* 200;

  //
  stroke(220,80,100);
  line(0,0,x,y);

  stroke(0,80,100);
  line(x,0,x,y);
  line(0,y,x,y);


  noStroke();
  fill(150,80,100);
  ellipse(x,y,20,20);


}
