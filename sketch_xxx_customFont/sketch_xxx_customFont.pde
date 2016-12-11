
// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  PFont font = createFont("Courier",185);
  textFont(font);
  textAlign(CENTER,CENTER);

}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,100);
  fill(0,0,0);
  text("TYPE",width/2,height/2);
}
