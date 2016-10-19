// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBの色指定
  background(0, 0, 100); // 背景を白に描画
  rectMode(CENTER); //矩形描画の原点を
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // 透明度を下げた矩形を毎フレーム描画：フェード効果
  fill(0, 0, 100, 10);
  rect(width/2, height/2, width, height);

  for (int i = 0; i < 20; i++) {
    //random関数を使って毎フレーム矩形の属性（位置、回転角度、大きさ、色）を決定
    float x = random(width);
    float y = random(height);
    float theta = random(TWO_PI);
    float size = random(10, 100);
    float hue = random(360);
    float saturation = random(50, 100);
    float brightness = random(50, 100);
    float alpha = random(10, 50);

    // 描画色を指定
    noStroke();
    fill(hue, saturation, brightness, alpha);

    // 位置を移動させてから描画
    pushMatrix();
    translate(x, y);
    rotate(theta);
    rect(0, 0, size, size);
    popMatrix();
  }
}