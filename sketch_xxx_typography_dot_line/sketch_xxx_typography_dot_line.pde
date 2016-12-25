color BACKGROUND_COLOR;
color FILL_COLOR;

PGraphics pg;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  BACKGROUND_COLOR = color(0,0,100);
  FILL_COLOR = color(0,0,0);

  PFont font = createFont("Yu-Gothic",300);

  pg = createGraphics(width,height);
  pg.beginDraw();
  pg.colorMode(HSB,360,100,100);
  pg.background(BACKGROUND_COLOR);
  pg.fill(FILL_COLOR);
  pg.textFont(font);
  pg.textSize(300);
  pg.textAlign(CENTER,CENTER);
  pg.text("自宅",width/2,height/2);
  pg.endDraw();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(BACKGROUND_COLOR);
  float nX = noise((width/2+frameCount)*0.09,frameCount*0.001);
  float nY = noise((height/2+frameCount)*0.08,frameCount*0.005);
  int gridX = (int)map(nX,0,.5,1,20);
  int gridY = (int)map(nY,0,.5,1,20);

  // int gridX = (int)map(mouseX,0,width,3,50);
  // int gridY = (int)map(mouseY,0,height,3,50);

  int margin = max(gridX,gridY) * 2;
  for(int y = -margin; y < height+margin; y+=gridY){
    for(int x = -margin; x < width+margin; x+=gridX){
      boolean inText = (pg.get(x,y)==FILL_COLOR);
      if(inText){
        fill(FILL_COLOR);
        noStroke();
        ellipse(x,y,gridX,gridX);
      }else{
        stroke(FILL_COLOR);
        line(x,y,x+gridX,y+gridX);
        line(x+gridX/2,y,x+gridX+gridX/2,y+gridX);
      }
    }
  }
}
