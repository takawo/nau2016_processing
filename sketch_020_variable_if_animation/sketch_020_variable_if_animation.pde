// 変数

boolean isPlus = true;
int x = 0;
int loopX = 0;
int step = 5;
int rectSize = 150;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); //カラーモードをHSBに
  noStroke();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  //H:0,S:0,B:100（彩度が0で明るさが100なので、色相に関係なく白）
  background(0, 0, 100);

  // 塗りつぶしの色を指定
  fill(60, 80, 100); // 黄色
  rect(x, 100, rectSize, rectSize); //矩形を描画

  // 塗りつぶしの色を指定
  fill(240, 80, 100); // 青色
  rect(loopX, 300, rectSize, rectSize); //矩形を描画

  if(x < 0 || x+150 > width){
    isPlus = !isPlus;
  }

  // もしisPlusが正しいとき
  if(isPlus == true){
    // 加算の書き方
    x = x + step; // xの値を変数stepずつ増やす
    }else{
      x = x - step;
    }
    // 数値を繰り返す手法：剰余を使う
    loopX = loopX + step; // loopXの値を変数stepずつ増やす
    // loopXが画面幅より出たとき0に戻す
    //（widthで割った余りが代入される）
    if(loopX > width){
      loopX = 0-rectSize;
    }
  }
