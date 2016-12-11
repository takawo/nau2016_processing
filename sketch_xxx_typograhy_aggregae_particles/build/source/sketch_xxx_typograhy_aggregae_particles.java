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

public class sketch_xxx_typograhy_aggregae_particles extends PApplet {

PGraphics pg;
int PGRAPHICS_COLOR = color(0,0,0);
int mode = 0;
int maxParticles = 100;
ArrayList<Particle> particles = new ArrayList<Particle>();

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

  pg = createGraphics(width,height);
  pg.beginDraw();
  PFont font = createFont("HiraKakuPro-W6",350);
  pg.textFont(font,350);
  pg.textAlign(CENTER,CENTER);
  pg.colorMode(HSB,360,100,100,100);
  pg.fill(0,0,0);
  pg.noStroke();
  pg.text("\u5730\u7344",pg.width/2,pg.height/2);
  pg.endDraw();

  background(0,0,100);
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  addRemoveParticles();
  for(Particle p : particles){
    p.update();
    p.display();
  }
}

public void addRemoveParticles(){
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

public void mousePressed() {
  background(0,0,100);
  mode = (mode+1)%3;
}
class Particle{
  PVector loc;
  PVector vel;
  float radius = 10;
  float life = random(1,3);
  float lifeRate = 0.03f;

  Particle(){
    getPosition();
    vel = PVector.random2D();
  }

  public void getPosition(){
    while(loc == null || !isInText(loc)){
      loc = new PVector(random(width),random(height));
    }
  }

  public void update(){
    vel.rotate(random(-TWO_PI/20,TWO_PI/20));
    loc.add(vel);
    switch(mode){
      case 0:
      if (!isInText(loc)){
        getPosition();
      }
      break;
      case 1:
      life -= lifeRate;
      radius *= 0.95f;
      break;
      case 2:
      if (!isInText(loc)){
        getPosition();
      }
      life -= lifeRate;
      radius *= 0.95f;
      break;
    }
  }

  public void display(){
    pushStyle();
    colorMode(HSB,360,100,100,100);
    fill(0,0,100);
    stroke(0,0,0,50);
    float r  = radius;
    switch(mode){
      case 0:
      break;
      case 1:
      break;
      case 2:
      break;
    }
    ellipse(loc.x,loc.y,r,r);
    popStyle();
  }

  public boolean isInText(PVector _loc){
    return pg.get(PApplet.parseInt(_loc.x),PApplet.parseInt(_loc.y))== PGRAPHICS_COLOR;
  }
}
  public void settings() {  size(960,540);  smooth(16); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_typograhy_aggregae_particles" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
