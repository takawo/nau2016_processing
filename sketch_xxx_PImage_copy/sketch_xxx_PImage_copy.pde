PImage src;
PImage dst;
// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  src = loadImage("nature-h-c-480-540-4.jpg");
  dst = src.get();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  image(src,0,0);
  image(dst,width/2,0);
}
