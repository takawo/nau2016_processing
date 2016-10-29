// 変数
float grid;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  ellipseMode(RADIUS);
  grid = 20;
  background(0,0,0);
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,0);
  translate(width/2+grid/2,height/2+grid/2);
  float n = 0;
  for(float y = -height/2; y < height/2; y+= grid){
    for(float x = -width/2; x < width/2; x+= grid){
      color c = color(map(x+y,-width/2-height/2,width/2+height/2,0,360),80,100);
      fill(c);
      float radius = map(sin(((x+y)+frameCount)*0.05),-1,1,grid/10,grid/2);
      ellipse(x,y,radius,radius);
      n++;
    }
  }
}
