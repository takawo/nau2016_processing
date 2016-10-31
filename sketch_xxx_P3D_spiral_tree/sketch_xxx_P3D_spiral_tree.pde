// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  noStroke(); // 線の色をナシに
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 背景を黒に
  background(0, 0, 0);
  // 画面の中心に原点を移動
  translate(width/2, height/2, -1000);
  rotateX(-PI); // X軸を中心に反転
  rotateY(frameCount*0.01); // Y軸を中心に回転
  // 開始点のy座標
  float y = -1000;
  // boxの色相
  float hue = frameCount;
  // 回転数の中で角度を繰り返し増加
  for (float angle = 0; angle < 360*10; angle += 17) {
    // 現在の角度をラジアンへ変換
    float theta = radians(angle);
    // 半径を回転数によって設定（250-0の間でマッピング）
    float r = map(angle,0,360*10,250,0);
    // Y軸を中心に回転するようにしているため、x,zで三角関数を適応する
    float x = cos(theta)*r;
    float z = sin(theta)*r;
    // 色を設定
    color c = color(hue,80,100);
    fill(c);
    // 原点座標を保存
    pushMatrix();
    // 計算した位置へ原点移動
    translate(x, y, z);
    // ボックスそのものを回転
    rotateZ(-frameCount*0.03);
    // ボックスを描画
    box(15);
    // 原点座標を復帰
    popMatrix();

    //y += map(sin(frameCount*0.05), -1, 1, 1, 10);
    // yを段階的に増やす = 螺旋階段状に回転していく
    y += 8;
    // 色相を増やす(360で割った余りを代入することで0-360で循環する)
    hue = (hue+1)%360;
  }
}
