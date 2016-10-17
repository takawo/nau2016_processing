// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  
  // 色指定をHSBのカラーモードに変更 : Hue(色相),Brightness(明度),Saturation(彩度)
  colorMode(HSB,360,100,100);
  
  // 色の指定は「メニュー」＞「ツール」＞「色選択」を使うと便利 
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,100); // 背景色を白色に指定
  
  noStroke(); // 線の色をナシに

  fill(140,80,100); // 塗りつぶしの色をhsb(140,80,100)に指定
  rect(-100,height/2-100,200,200);
  
  fill(170,80,100); // 塗りつぶしの色をhsb(170,80,100)に指定
  rect(width*1/4-100,height/2-100,200,200);

  fill(200,80,100); // 塗りつぶしの色をhsb(200,80,100)に指定
  rect(width*1/2-100,height/2-100,200,200);

  fill(230,80,100); // 塗りつぶしの色をhsb(230,80,100)に指定
  rect(width*3/4-100,height/2-100,200,200);

  fill(260,80,100); // 塗りつぶしの色をhsb(260,80,100)に指定
  rect(width-100,height/2-100,200,200);

}