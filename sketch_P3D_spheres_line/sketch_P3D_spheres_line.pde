// reference: http://p5aholic.hatenablog.com/entry/2015/06/15/194250

float velocity = 0;        // tに足す値
float acceleration = 0.05; // velocityに足す値

void setup() {
  size(960, 540, P3D); // ウィンドウサイズの指定
  colorMode(HSB, 360, 100, 100); // HSBの色空間
  sphereDetail(8); // 球の解像度を指定
}

void draw() {
  background(0, 0, 0); // 背景を黒に指定

  translate(width/2, height/2, -300); //画面の中心に原点を移動
  rotateX(frameCount*0.01); // X軸を中心に回転
  rotateY(frameCount*0.005); // Y軸を中心に回転

  // 一つ前の座標を格納する
  float lastX = 0;
  float lastY = 0;
  float lastZ = 0;

  // 半径
  float radius = 400;
  // 角度
  float s = 0;
  float t = 0;

  while (s <= 180) {
    float radianS = radians(s);
    float radianT = radians(t);

    // 現在の座標を更新
    float x = radius * sin(radianS) * cos(radianT);
    float y = radius * sin(radianS) * sin(radianT);
    float z = radius * cos(radianS);

    stroke(220,80,100);
    if (lastX != 0) {
      strokeWeight(1);
      // 現在の座標から一つ前の座標に線を引く
      line(x, y, z, lastX, lastY, lastZ);
    }
    pushMatrix();
    translate(x,y,z);
    fill(220,80,100);
    noStroke();
    sphere(4);
    popMatrix();

    // 一つ前の座標を更新
    lastX = x;
    lastY = y;
    lastZ = z;

    // sとtを同時に更新
    s++;
    t+=36;
  }
  velocity += map(sin(frameCount*0.01),-1,1,-0.5,0.5);
}
