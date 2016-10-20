// reference: http://p5aholic.hatenablog.com/entry/2015/06/15/194250

int numPoints = 1000;
float[] xPos = new float[numPoints];
float[] yPos = new float[numPoints];
float[] zPos = new float[numPoints];

void setup(){
  size(960,540,P3D); // ウィンドウサイズを960px,540pxに,3D描画モードに設定
  colorMode(HSB,360,100,100,100); // 色空間をHSBに
  sphereDetail(8); // 球の解像度を指定
  // 半径200の球体上に点をランダムに配置
  for(int i = 0; i < numPoints; i++){
    float radianS = radians(random(180));
    float radianT = radians(random(360));
    xPos[i] = 200 * sin(radianS) * cos(radianT);
    yPos[i] = 200 * sin(radianS) * sin(radianT);
    zPos[i] = 200 * cos(radianS);

    /*
    x = sin(radianS) * cos(radianT)
    y = sin(radianS) * sin(radianT)
    z = cos(radianS)
    は、半径1の球体の座標を計算していることになる
    */
  }
  background(0,0,0);
}

void draw(){
  pushMatrix();
  ambientLight(0,0,100); // 白色のアンビエントライト
  translate(width/2, height/2, 0); // 座標を原点へ移動
  rotateX(frameCount*0.003);
  rotateZ(frameCount*0.007);

  for(int i = 0; i < numPoints; i++){
    pushMatrix(); // 処理前に原点位置を保存
    translate(xPos[i], yPos[i], zPos[i]); // 描画する球の位置に移動
    fill(220,80,100); // 塗りつぶしの色を指定
    noStroke(); // 線の色をナシに
    sphere(2); // 球を描画
    popMatrix(); // 処理後に保存した原点位置に復帰
  }
  fill(0,0,0,5);
  popMatrix();
  rect(0,0,width,height);
}
