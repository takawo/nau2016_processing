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

public class sketch_xxx_typograpy_spike extends PApplet {

PGraphics graphic;
int numParticle = 2500;
ArrayList<Particle> particles = new ArrayList<Particle>();
int grid = 5;
int PGRAPHICS_COLOR;
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100, 100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b

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
  graphic.text("\u6bdb\u7389\nis\n\u53d6\u308c\u306a\u3044", width/2, height/2);
  graphic.endDraw();

  while(particles.size() < numParticle){
    Particle p = new Particle();
    p.getPosition();
    particles.add(p);
  }
  background(0, 0, 100);
}


// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

public void mousePressed(){
  background(0,0,100);

}
class Particle{
  PVector loc;
  PVector vel;
  float radius;
  float maxLife;
  float life;
  float lifeRate;
  int c;

  Particle(){
    init();
  }

  public void init(){
    getPosition();
    float n = random(-1,1);
    vel = PVector.random2D();
    vel.mult(2);
    c = color(0,0,0,20);
    life = random(0.5f,1);
    radius = random(1,3);
    maxLife = random(0.5f,1.5f);
    life = random(maxLife/2,maxLife);
    lifeRate = 0.03f;
  }

  public void getPosition(){
    while(loc == null || !isInText(loc)){
      loc = new PVector(random(width),random(height));
    }
  }

  public void update(){
    float n = noise(loc.x/100f,loc.y/100f,frameCount*0.01f);
    vel.rotate(map(n,0,1,-PI,PI));
    loc.add(vel);
    if (!isInText(loc)){
      lifeRate += 0.01f;
    }
    life -= lifeRate;
    if(life < 0){
      init();
    }
  }

  public void display(){
    pushStyle();
    colorMode(HSB,360,100,100,100);
    noStroke();
    fill(c);
    float r = map(life,0,maxLife,0,radius);
    ellipse(loc.x,loc.y,r,r);
    popStyle();
  }

  public boolean isInText(PVector _loc){
    return graphic.get(PApplet.parseInt(_loc.x),PApplet.parseInt(_loc.y))== PGRAPHICS_COLOR;
  }
}
  public void settings() {  size(960, 540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_typograpy_spike" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
