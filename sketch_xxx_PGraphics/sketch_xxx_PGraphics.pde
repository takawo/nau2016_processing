PGraphics pg;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  pg = createGraphics(width,height);
  pg.beginDraw();
  PFont font = createFont("Courier",175);
  pg.textFont(font,175);
  pg.textAlign(CENTER,CENTER);
  pg.colorMode(HSB,360,100,100);
  pg.background(0,0,100);
  pg.fill(0,0,0);
  pg.text("TYPE",width/2,height/2);
  pg.endDraw();
  imageMode(CENTER);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,50);
  image(pg,mouseX,mouseY);
}
