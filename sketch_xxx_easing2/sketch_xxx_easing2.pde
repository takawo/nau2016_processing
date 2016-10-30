// 変数
float x,y; // こんな風に宣言も出来る
float sx,ex,tx;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  rectMode(CENTER);

  sx = 100;
  ex = width-sx;

  x = sx;
  y = height/2;
  tx = ex;
  background(0,0,100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  fill(0,0,100,3); // 背景を白に
  rect(width/2,height/2,width,height);

  fill(220,80,100); // 塗りつぶしを青に
  noStroke(); // 線の描画をナシに
  float t = (frameCount%200)/200f; // tを0.0-1.0の間で繰り返し増加
  if(t == 0){ // tが0になったとき
    float temp;
    if(x == 100){
      x = sx;
      tx = ex;
    }else{
      x = ex;
      tx = sx;
    }
  }
  // イージングの関数lerp : 始点の値xと終点の値txの間で、割合t(0.0-1.0)で位置を決める
  x = lerp(x,tx,t);
  rect(x,y,50,50);

}

// mouseMoved関数 : マウスがクリックされたときに実行される
void mouseMoved(){

}

// mousePressed関数 : マウスがクリックされたときに実行される
void mousePressed(){

}

// mouseReleased関数 : クリックが解放されたときに実行される
void mouseReleased(){

}

// mouseDraged関数 : マウスがドラッグされたときに実行される
void mouseDragged(){

}
