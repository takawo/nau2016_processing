// 変数
int num = 60; // 配列の個数
int[] posX = new int[num]; // mouseXの数値を格納していく配列
int[] posY = new int[num]; // mouseYの数値を格納していく配列

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  frameRate(200);

  // 配列の初期化
  for(int i = 0; i < num; i++){
    posX[i] = width/2;
    posY[i] = height/2;
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  fill(0,0,0,10);
  noStroke();
  rect(0,0,width,height);
  if(mouseX == 0 && mouseY == 0){
    return;
  }
  for(int j = num-1; j > 0; j-- ){
    posX[j] = posX[j-1];
    posY[j] = posY[j-1];
  }
  posX[0] = mouseX;
  posY[0] = mouseY;

  for(int i = 0; i < num-1; i++){
    float sw = map(i,0,num-1,10f,1f);
    color c = color((frameCount+i)%360,80,100);
    stroke(c);
    strokeWeight(sw);
    line(posX[i],posY[i],posX[i+1],posY[i+1]);
  }
}

// mouseMoved関数 : マウスがクリックされたときに実行される
void mouseMoved(){

}

// mousePressed関数 : マウスがクリックされたときに実行される
void mousePressed(){

}

// mouseReleased関数 : クリックが解放されたときに実行される
void mouseReleased(){

}

// mouseDraged関数 : マウスがドラッグされたときに実行される
void mouseDragged(){

}
