PGraphics pg;
int mode = 0;
int drawSpeed = 200;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(16); // 描画を滑らかに

  pg = createGraphics(width,height);
  pg.beginDraw();
  pg.textSize(350);
  pg.textAlign(CENTER,CENTER);
  pg.colorMode(HSB,360,100,100,100);
  pg.fill(0,0,0);
  pg.noStroke();
  pg.text("TYPE",pg.width/2,pg.height/2);
  pg.endDraw();

  background(0,0,100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  for(int i = 0; i < drawSpeed; i++){
    int x = (int) random(pg.width);
    int y = (int) random(pg.height);
    color c = pg.get(x,y);
    if(c == color(0,0,0)){
      drawObject(x,y,mode);
    }
  }
}

void drawObject(int x ,int y, int mode){
  pushMatrix();
  translate(x, y);
  switch (mode) {
  case 0:
    float er = random(3, 15);
    color ec = color(random(0,120), 100, 100);
    noStroke();
    fill(ec);
    ellipse(0, 0, er, er);
    break;
  case 1:
    float td = random(3, 7.5);
    float tr = random(TWO_PI);
    color tc = color(random(120, 240), 100, random(50, 100));
    noStroke();
    fill(tc);
    rotate(tr);
    triangle(0, -td, -td, td, td, td);
    break;
  case 2:
    float rw = random(5, 7.5);
    float rh = random(5, 15);
    float rr = random(TWO_PI);
    color rc = color(random(240,360), random(70, 100), random(20, 100));
    noStroke();
    fill(rc);
    rotate(rr);
    rect(0, 0, rw, rh);
    break;
  }
  popMatrix();
}

void mousePressed(){
  background(0,0,100);
  mode = (mode + 1)%3;
}
