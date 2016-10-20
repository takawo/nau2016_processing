String str = "";

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100,100);
  textAlign(CENTER,CENTER);
  textSize(64);
  fill(0,0,0);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,100);
  text(str,width/2,height/2);
}

/*
**  マウスイベント（クリック・ドラッグ）関数
*/

// mousePressed関数 : クリックした時
void mousePressed() {
  println("mousePressed");
  str = "mousePressed!";
}

// mouseReleased関数 : クリックを離した時
void mouseReleased() {
  println("mouseReleased");
  str = "mouseReleased!";
}
// mouseDragged関数：マウスをドラッグしたとき
void mouseDragged() {
  println("mouseDragged");
  str = "mouseDragged!";
}

// mouseMoved関数：マウスを動かしたとき
void mouseMoved() {
  println("mouseMoved");
  str = "mouseMoved!";
}
