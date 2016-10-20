// reference: http://p5aholic.hatenablog.com/entry/2015/06/15/194250

float r = 300;
// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540,P3D); // ウィンドウサイズを960px,540pxに,3D描画モードに設定
  colorMode(HSB,360,100,100,100); // 色空間をHSBに
  sphereDetail(8); // 球の解像度を指定
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,0); // 背景を黒に
  translate(width/2,height/2,-300); //原点を画面中央に

  lights(); // ライティング

  rotateX(frameCount*0.003); // X軸を中心として回転
  rotateY(frameCount*0.005); // Y軸を中心として回転

  // 入れ子に
  for(float angle2 = 0; angle2 < 180; angle2 += 10){
    float theta2 = radians(angle2);
    float z = cos(theta2)*r;
    for(float angle1 = 0; angle1 < 360; angle1 += 10){
      float theta1 = radians(angle1);
      float x = cos(theta1)*r*sin(theta2);
      float y = sin(theta1)*r*sin(theta2);
      pushMatrix(); // 処理前に原点位置を保存
      translate(x,y,z); // 描画する球の位置に移動
      fill(220,80,100); // 塗りつぶしの色を指定
      noStroke(); // 線の色をナシに
      sphere(5); // 球を描画
      popMatrix(); // 処理後に保存した原点位置に復帰
    }
  }
}
