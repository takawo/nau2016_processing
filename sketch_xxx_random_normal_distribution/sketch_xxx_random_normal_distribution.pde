// setup関数 : 初回1度だけ実行される
void setup(){
  size(1000,500); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  background(0,0,0);
  stroke(0,0,100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,0);
  for(int i = 0; i < 100000; i++){
    float x = random(width/2);
    float y = random(height);
    point(x,y);
  }
  translate(width/2,0);
  for(int i = 0; i < 100000; i++){
    float x = (random(width/2)+random(width/2)+random(width/2)+random(width/2)+random(width/2))/5;
    float y = (random(height)+random(height)+random(height)+random(height)+random(height))/5;
    point(x,y);
  }
  noLoop();
}
