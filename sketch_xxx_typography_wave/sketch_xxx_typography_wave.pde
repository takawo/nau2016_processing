PGraphics pg;

int gridX = 5;
int gridY = 10;
float waveHeight = 30;
float baseHeight = 5;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540,P2D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(16); // 描画を滑らかに
  pg = createGraphics(width,height);
  pg.beginDraw();
  PFont f = createFont("Courier", 400);
  pg.textFont(f);
  pg.textAlign(CENTER,CENTER);
  pg.colorMode(HSB,360,100,100,100);
  pg.fill(0,0,0);
  pg.text("TYPE",pg.width/2,pg.height/2);
  pg.endDraw();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,100);
  float fc = frameCount * 0.01;
  for(int y = 0; y < pg.height; y += gridY){
    boolean continuous = false;
    for(int x = 0; x < pg.width; x += gridX){
      float vy = (float)y;
      float vx = (float)x;
      color c = pg.get(x,y);
      boolean inText;
      if(c == color(0,0,0)){
        inText = true;
      }else{
        inText = false;
      }
      if(inText){
        if(!continuous){
          continuous = true;
          fill((vy*width + vx + frameCount)%360,80,100);
          noStroke();
          beginShape();
          vertex(vx,vy);
        }
        float n = noise(vx+fc,vy,fc);
        vy -= n * n * waveHeight + baseHeight;
        curveVertex(vx,vy);
      }else{
        if(continuous){
          continuous = false;
          vertex(vx,vy);
          endShape(CLOSE);
        }
      }




    }
  }
}
