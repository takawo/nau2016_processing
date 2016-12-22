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

public class sketch_10 extends PApplet {

ArrayList<Particle> particles = new ArrayList<Particle>();
int maxParticles = 100;
PGraphics pg;

int PGRAPHICS_COLOR;
int BACKGROUND_COLOR;

float fc;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

  PGRAPHICS_COLOR = color(0,0,0);
  BACKGROUND_COLOR = color(0,0,100);

  PFont font = createFont("YuGothic-Bold", 300);

  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.textFont(font,300);
  pg.textSize(300);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  pg.text("TYPE", pg.width/2, pg.height/2);
  pg.endDraw();

  background(BACKGROUND_COLOR);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  fc = frameCount * 0.01f;
  addRemoveParticles();
  // update and display each particle in the list
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

public void addRemoveParticles() {
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
  while (particles.size () < maxParticles) {
    particles.add(new Particle());
  }
}

class Particle{
  PVector pos;
  PVector vel;
  float life,maxLife,lifeRate;

  Particle(){
    getPosition();
    maxLife = random(0.5f,1.2f);
    life = random(maxLife/2,maxLife);
    lifeRate = random(0.01f,0.02f);
  }

  public void update(){
    float angle = noise(pos.x * 0.01f, pos.y * 0.01f, fc) * TWO_PI;
    PVector vel = PVector.fromAngle(angle + fc);
    pos.add(vel);
    life -= lifeRate; // decrease life by the lifeRate (the particle is removed by the addRemoveParticles() method when no life is left)
  }

  public void display() {
    fill(255); // white fill
    stroke(0, 125); // transparant black stroke
    float r = 8 * life/maxLife; // radius of the ellipse
    ellipse(pos.x, pos.y, r, r); // draw ellipse
  }
  public void getPosition() {
    while (pos == null || !isInText (pos)) pos = new PVector(random(width), random(height));
  }

  public boolean isInText(PVector v) {
    return pg.get(PApplet.parseInt(v.x), PApplet.parseInt(v.y)) == PGRAPHICS_COLOR;
  }


}
  public void settings() {  size(960,540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_10" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
