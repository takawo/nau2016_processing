import processing.video.*;

// ビデオカメラ
Capture cam;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(1280, 720); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  // カメラの初期化
  cam = new Capture(this,1280,720);
  cam.start(); // カメラの起動
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  fill(0,0,100,10);
  rect(0,0,width,height);
  // カメラが利用可能な時
  if (cam.available()) {
    // カメラからの映像読み込み
    cam.read();
  }
  // ピクセレートのサイズ
  int grid = 10;
  // x,yそれぞれの方向で繰り返し処理
  for (int y = 0; y < cam.height; y += grid) {
    for (int x = 0; x < cam.width; x += grid) {
      // x,y座標でカメラの該当座標の色を取得
      color c = cam.get(x, y);
      float hue = hue(c);
      float theta = radians(hue);
      float x2 = cos(theta) * grid;
      float y2 = sin(theta) * grid;
      pushMatrix();
      // 塗りつぶしの色に指定
      stroke(c);
      strokeWeight(3);
      translate(x,y);
      line(0,0,x2,y2);
      popMatrix();
    }
  }
  // 左上にカメラの画像を表示
  image(cam, 20, 20, 320, 180); // x:20 y:20の位置に320x180pxで描画
}
