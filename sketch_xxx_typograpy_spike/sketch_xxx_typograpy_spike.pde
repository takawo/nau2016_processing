PGraphics graphic;
int numParticle = 2500;
ArrayList<Particle> particles = new ArrayList<Particle>();
int grid = 5;
color PGRAPHICS_COLOR;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  PFont font = createFont("YuGothic-Bold", 100);
  PGRAPHICS_COLOR = color(0,0,0);
  graphic = createGraphics(width, height);
  graphic.beginDraw();
  graphic.colorMode(HSB, 360, 100, 100, 100);
  graphic.background(0, 0, 100);
  graphic.textAlign(CENTER, CENTER);
  graphic.textFont(font, 150);
  graphic.textLeading(140);
  graphic.fill(PGRAPHICS_COLOR);
  graphic.text("毛玉\nis\n取れない", width/2, height/2);
  graphic.endDraw();

  while(particles.size() < numParticle){
    Particle p = new Particle();
    p.getPosition();
    particles.add(p);
  }
  background(0, 0, 100);
}


// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

void mousePressed(){
  background(0,0,100);

}
