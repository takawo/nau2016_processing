PGraphics pg;
color PGRAPHICS_COLOR = color(0,0,0);
int mode = 0;
int maxParticles = 100;
ArrayList<Particle> particles = new ArrayList<Particle>();

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(16); // 描画を滑らかに

  pg = createGraphics(width,height);
  pg.beginDraw();
  PFont font = createFont("HiraKakuPro-W6",350);
  pg.textFont(font,350);
  pg.textAlign(CENTER,CENTER);
  pg.colorMode(HSB,360,100,100,100);
  pg.fill(0,0,0);
  pg.noStroke();
  pg.text("地獄",pg.width/2,pg.height/2);
  pg.endDraw();

  background(0,0,100);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  addRemoveParticles();
  for(Particle p : particles){
    p.update();
    p.display();
  }
}

void addRemoveParticles(){
  if(mode >= 0){
    for(int i = particles.size()-1; i >= 0; i--){
      Particle p = particles.get(i);
      if(p.life < 0){
        particles.remove(i);
      }
    }
  }
  while(particles.size() < maxParticles){
    particles.add(new Particle());
  }
}

void mousePressed() {
  background(0,0,100);
  mode = (mode+1)%3;
}
