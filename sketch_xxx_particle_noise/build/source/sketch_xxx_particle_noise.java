import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_particle_noise extends PApplet {

ArrayList<Particle> particles = new ArrayList<Particle>();
int NUM_PARTICLE;
int maxParticles = 0;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
int clickCount = 0;
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

  for (float r = 100; r < 350; r += 50) {
    for (float angle = 0; angle < 360; angle += 5) {
      float theta = radians(angle);
      Particle particle = new Particle(cos(theta)*r, sin(theta)*r);
      particles.add(particle);
      maxParticles++;
    }
  }
  NUM_PARTICLE = maxParticles;
  background(0, 0, 100);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  translate(width/2, height/2);

  addRemoveParticles();
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}
public void addRemoveParticles() {
  // remove particles with no life left
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
  // add particles until the maximum
  while (particles.size () < maxParticles) {
    float theta = random(TWO_PI);
    float r = PApplet.parseInt(random(2,7))*50;
    Particle particle = new Particle(cos(theta)*r, sin(theta)*r);
    particles.add(particle);
  }
}

public void mousePressed(){
  clickCount++;
  if(clickCount%2 == 0){
    println("even",NUM_PARTICLE);
    maxParticles = NUM_PARTICLE;
  }else{
    println("odd");
    maxParticles = 0;
  }
  // saveframe;
}

class Particle {
  PVector pos;
  float maxLife, life, lifeRate;
  Particle(float x, float y) {
    pos = new PVector(x, y);
    maxLife = random(0.5f, 1.25f);
    life = random(maxLife*0.5f, maxLife);
    lifeRate = random(0.01f, 0.02f);
  }

  public void update() {
    float angle = noise(pos.x*0.01f, pos.y*0.01f, frameCount*0.01f)*TWO_PI;
    PVector vel = PVector.fromAngle(angle);
    pos.add(vel);
    life -= lifeRate;
  }

  public void display() {
    fill(0, 0, 100);
    stroke(0, 0, 0, 50);
    float r = 8 * map(life, 0, maxLife, 0, 1.0f);
    ellipse(pos.x, pos.y, r, r);
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_particle_noise" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
