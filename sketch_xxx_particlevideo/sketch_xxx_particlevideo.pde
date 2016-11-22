import processing.video.*;

//if Capture doesn't grab Camera,
// open Terminal.app and enter 'sudo killall VDCAssistant' + pass.
ArrayList<Particle> particles = new ArrayList<Particle>();
int num = 1000;
Capture video;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(1280, 720,P3D); // ウィンドウサイズを1280px,720pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  //printArray(Capture.list());
  video = new Capture(this, 1280, 720);
  video.start();
  for (int i =0; i < num; i++) {
    Particle particle = new Particle(width/2, height/2);
    particles.add(particle);
  }
  background(0, 0, 0);
  sphereDetail(8);
}

void captureEvent(Capture video) {
  video.read();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  lights();
  for (Particle particle : particles) {
    particle.update();
    particle.display();
  }
}

class Particle {
  PVector pos;
  PVector vel;
  color c;
  float radius;
  Particle(float _x, float _y) {
    pos = new PVector(_x, _y);
    float _xSpeed = random(-1, 1);
    float _ySpeed = random(-1, 1);
    vel = new PVector(_xSpeed, _ySpeed);
    radius = random(8, 15);
  }
  void update() {
    pos.add(vel);
    c = video.get((int)pos.x, (int)pos.y);
    pos.z = 100-brightness(c);
    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }
  void display() {
    //fill(c);
    //noStroke();
    //pushMatrix();
    //translate(pos.x,pos.y,pos.z);
    //sphere(radius);
    //popMatrix();
    fill(c);
    noStroke();
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    ellipse(0,0,radius,radius);
    popMatrix();
    
  }
}