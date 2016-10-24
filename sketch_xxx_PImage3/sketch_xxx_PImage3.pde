
PImage img;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100);
  noStroke();
  img = loadImage("lena_color.jpg"); //画像を読み込み
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 背景を白に
  background(0, 0, 100);

  int grid = 10;
  //int grid = int(noise(frameCount*0.03)*50);

  // imgの各ピクセルにアクセスして色情報を取得
  for (int y = 0; y < img.height; y += grid) {
    for (int x = 0; x < img.width; x += grid) {
      // 画像のピクセルから色情報を取得
      color c = img.get(x, y);
      // 色情報から色相(0-360)を取得
      float angle = hue(c);
      // 弧度法（ラジアン）に変換
      float theta = radians(angle);

      // 色指定
      stroke(c);
      // 大きさを指定
      strokeWeight(grid/3);

      pushMatrix(); // 原点の位置を保存
      translate(x,y); // 原点の位置を移動
      rotate(theta); // 回転（色相をもとに）
      line(0,0,grid*2,0); // 線を引く
      popMatrix(); // 原点の位置を復帰
    }
  }
  // 元画像を表示
  image(img,512,0);
}
