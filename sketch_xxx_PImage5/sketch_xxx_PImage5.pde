// 変数
PImage img;
// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  img = loadImage("animals-q-c-960-540-4.jpg");
  background(0,0,100);
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){

  for(int i = 0; i < 100; i++){

    int x = (int)random(img.width);
    int y = (int)random(img.height);
    int size = (int)random(img.height/100,img.height/50);

    PImage imgRect = img.get(x,y,size,size);
    image(imgRect,random(x-20,x+20),random(y-20,y+20));
  }
}
