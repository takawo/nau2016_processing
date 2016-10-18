PFont font;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100);
  noStroke();
  // 「メニュー」＞「ツール」＞「フォント作成」から
  // .vlw形式のフォントファイルを作成する
  font = loadFont("KyokaICAPro-Regular-24.vlw");
  // 選択したフォントをテキストフォントに指定 
  textFont(font);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);

  fill(0, 0, 0); //塗りつぶし(文字)の色を黒に 
  textAlign(LEFT, TOP); //文字の行揃えを左揃え、上揃えに
  text("Here is Left/Top.", 20, 20); //x=20,y=20の位置にテキストを表示

  fill(0, 100, 100);  
  // x=20,y=20に円を描画
  ellipse(20, 20, 5, 5);

  fill(0, 0, 0); //塗りつぶし(文字)の色を黒に 
  textAlign(CENTER, CENTER); //文字の行揃えを中央揃えに
  text("Here is Center/Center.", width/2, height/2); //画面中央の位置にテキストを表示

  fill(240, 100, 100);  
  // 画面中央に円を描画
  ellipse(width/2, height/2, 5, 5);
  
  fill(0, 0, 0); //塗りつぶし(文字)の色を黒に 
  textAlign(RIGHT, BOTTOM); //文字の行揃えを右揃え、下揃えに
  text("Here is Right/Bottom.", width-20, height-20); //x=width-20,y=height-20の位置にテキストを表示

  fill(120, 100, 100);  
  // x=width-20,y=height-20に円を描画
  ellipse(width-20, height-20, 5, 5);
}