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

public class sketch_xxx_mover_attractor3_mutual extends PApplet {

float g = 0.4f;
int num = 50;
ArrayList<Mover> movers = new ArrayList<Mover>();
// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup(){
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB,360,100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  for(int i = 0; i < num; i++){
    Mover m = new Mover(random(0.1f,2),random(width),random(height));
    movers.add(m);
  }
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw(){
  background(0,0,100);
  for(int i = 0; i < movers.size(); i++){
    for(int j = 0; j < movers.size(); j++){
      if(i != j){
        PVector force = movers.get(j).attract(movers.get(i));
        movers.get(i).applyForce(force);
      }
    }
    movers.get(i).update();
    movers.get(i).display();
  }
}

class Mover{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  int c;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(random(200,240),80,100);
  }

  public void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  public void display() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, mass*24, mass*24);
  }

  public PVector attract(Mover m) {
    PVector force = PVector.sub(position, m.position);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0f, 25.0f);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }


}
  public void settings() {  size(960,540);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_mover_attractor3_mutual" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
