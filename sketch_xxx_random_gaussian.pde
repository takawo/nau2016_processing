import  java.util.Random;

Random generator;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  generator = new Random();
  background(0,0,100);
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){

  float x = width/2;
  float h = (float)generator.nextGaussian();
  float stddev = 100;
  float mean = width/2;
  h *= stddev;
  h += mean;
  fill(0,0,0,10);
  ellipse(h,height/2,10,10);
}
