// 変数
float grid = 100;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  int counter = 0;
  for(float y = 0; y < height; y += grid){
    counter++;
    if(counter%2==0){
      // even 偶数のとき
      for(float x = 0; x < width; x += grid ){
        float hue = noise(x/100f,y/100f,frameCount/100f)*360;
        color c = color(hue,80,100);
        fill(c);
        rect(x,y,grid,grid);
      }
    }else{
      for(float x = -grid/2; x < width+grid/2; x += grid ){
        // even 偶数のとき
        float hue = noise(x/100f,y/100f,frameCount/100f)*360;
        color c = color(hue,80,100);
        fill(c);
        rect(x,y,grid,grid);
      }
    }
  }
}
