
// width : ディスプレイウィンドウの幅を格納するシステム変数
// height : ディスプレイウィンドウの高さを格納するシステム変数
// Processing側で用意されているので特に何も宣言しなくても呼び出して使える

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); //ウィンドウサイズを960px,540pxに
  
  // 画面の情報をコンソールに出力
  println("width :" + width + "px");
  println("height :" + height + "px");
  
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  // 背景色を指定(R,G,B)
  background(255,255,255); //RGBは各0-255の数値で色を指定する
  
  
  
  ellipse(width/2,height/2,200,200);
}