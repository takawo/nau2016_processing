ParticleSystem ps;
color[] chemistry = {#0C2550, #A3D0C1, #FDF6DD, #FEE406, #F4651C};
color[] palette = chemistry;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  blendMode(ADD);
  smooth(); // 描画を滑らかに

  ps = new ParticleSystem(new PVector(width/2, height/2), palette);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  float amplitudeX = 350;
  float periodX = 240*2;
  float amplitudeY = 150;
  float periodY = 120*2;
  float x = width/2 + cos(TWO_PI * frameCount/periodX) * amplitudeX;
  float y = height/2 + sin(TWO_PI * frameCount/periodY) * amplitudeY;
  ps.origin.set(x, y);
  ps.addParticle();
  ps.run();
}