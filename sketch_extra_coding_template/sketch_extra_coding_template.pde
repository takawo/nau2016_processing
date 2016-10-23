// 変数


// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100);

}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  stroke(0,0,0);
  line(pmouseX,pmouseY,mouseX,mouseY);

  noStroke();
  fill(frameCount*0.1,80,100);
  ellipse(mouseX,mouseY,10,10);

}

/*
**  マウスイベント（クリック・ドラッグ）関数
*/

// mousePressed関数 : クリックした時
void mousePressed() {

}

// mouseReleased関数 : クリックを離した時
void mouseReleased() {

}
// mouseDragged関数：マウスをドラッグしたとき
void mouseDragged() {

}

// mouseMoved関数：マウスを動かしたとき
void mouseMoved() {

}

// keyPressed関数：キーボードのキーをタイプした時
void keyPressed(){

}

// keyPressed関数：キーボードのキーを押して離した時
void keyReleased(){

}
