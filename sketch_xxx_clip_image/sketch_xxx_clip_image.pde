PImage img;

void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100);
  imageMode(CENTER);
  smooth(); // 描画を滑らかに
  // 画像の読み込み
  img = loadImage("animals-q-c-960-540-4.jpg");
}

void draw() {
  // 背景を白に描画
  background(0,0,100);
  // マウスを押下したときだけクリップしない
  if (mousePressed) {
    noClip();
  } else {
    // それ以外のときにマウスを中心にw200 / h200pxの矩形でクリップ
    clip(mouseX, mouseY, 200, 200);
  }
  // クリップするもととなる画像を画面に描画
  image(img,width/2,height/2);
}