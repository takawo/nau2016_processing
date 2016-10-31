
size(960,540); // ウィンドウサイズを960px,540pxに
colorMode(HSB,360,100,100); // HSBでの色指定にする
smooth(); // 描画を滑らかに
noStroke(); // 線の色をナシに

color c1 = color(70,80,100); // 起点の色C1
color c2 = color(180,80,100);// 終点の色C2

for(float x = 0; x < width; x += 1){
  //lerpColor : 起点の色、終点の色、割合(0.0-1.0)で色を生成する
  color c = lerpColor(c1,c2,x/width);
  fill(c);
  rect(x,0,5,height);
}
