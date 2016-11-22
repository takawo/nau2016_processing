import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gifAnimation.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_xxx_random_normal_distribution3D extends PApplet {



ArrayList<Point> points = new ArrayList<Point>();
float nSize = 400;
boolean isKoku;
int num = 1000;

// \u5909\u6570
GifMaker gifExport;
float gifCount = 90;
boolean isRecord = false;

// setup\u95a2\u6570 : \u521d\u56de1\u5ea6\u3060\u3051\u5b9f\u884c\u3055\u308c\u308b
public void setup() {
   // \u30a6\u30a3\u30f3\u30c9\u30a6\u30b5\u30a4\u30ba\u3092960px,540px\u306b
  colorMode(HSB, 360, 100, 100,100); // HSB\u3067\u306e\u8272\u6307\u5b9a\u306b\u3059\u308b
  blendMode(ADD);
   // \u63cf\u753b\u3092\u6ed1\u3089\u304b\u306b
  sphereDetail(0);
  isKoku = false;

  for(int i = 0; i < num; i++){
    Point p = new Point();
    points.add(p);
  }
  gifInit();
}

// draw\u95a2\u6570 : setup\u95a2\u6570\u5b9f\u884c\u5f8c\u7e70\u308a\u8fd4\u3057\u5b9f\u884c\u3055\u308c\u308b
public void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, -500);
  rotateX(frameCount/gifCount/4*TWO_PI);
  rotateY(frameCount/gifCount/16*TWO_PI);
  rotateZ(frameCount/gifCount/16*TWO_PI);
  lights();
  ambientLight(0,0,80);
  stroke(220, 80, 40, 30);
  strokeWeight(0.5f);
  noFill();
  line(-nSize * 10, 0, 0, nSize*10, 0, 0);
  line(0, -nSize * 10, 0, 0, nSize*10, 0);
  line(0, 0, -nSize * 10, 0, 0, nSize*10);
  float sum = 0;
  for(Point p : points){
    p.update();
    p.display();
    sum += p.culDist();
    for(Point q : points){
      if(p.current_pos.equals(q.current_pos) == false){
          if(PVector.dist(p.current_pos,q.current_pos) < 100){
          stroke(220, 80, 40, 50);
          strokeWeight(1);
          line(p.current_pos.x,p.current_pos.y,p.current_pos.z,q.current_pos.x,q.current_pos.y,q.current_pos.z);
        }
      }
    }
  }
  if(sum < 1.0f){
    reverseDirection();
  }
  gifDraw();
}

public void gifInit() {
  if (isRecord == false) {
    return;
  }
  gifExport = new GifMaker(this, getClass().getSimpleName() +".gif"); // \u30d5\u30a1\u30a4\u30eb\u540d\u306eGIF\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u3092\u4f5c\u6210
  gifExport.setRepeat(0); // \u30a8\u30f3\u30c9\u30ec\u30b9\u518d\u751f
  gifExport.setQuality(8); // \u30af\u30aa\u30ea\u30c6\u30a3(\u30c7\u30d5\u30a9\u30eb\u30c810)
  gifExport.setDelay(33); // \u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u306e\u9593\u9694\u309230ms(33fps)\u306b
}

public void gifDraw() {
  if (isRecord == false) {
    return;
  }
  //GIF\u30a2\u30cb\u30e1\u30fc\u30b7\u30e7\u30f3\u306e\u4fdd\u5b58
  if (frameCount <= gifCount) {
    gifExport.addFrame(); // \u30d5\u30ec\u30fc\u30e0\u3092\u8ffd\u52a0
  } else {
    gifExport.finish(); // \u7d42\u4e86\u3057\u3066\u30d5\u30a1\u30a4\u30eb\u4fdd\u5b58
    exit();
  }
}

public void reverseDirection(){
  for(Point p:points){
    if(isKoku){
      p.target_pos = p.pos.copy();
    }else{
      p.target_pos = p.koku_pos.copy();
    }
  }
  isKoku = !isKoku;
}

public void mousePressed() {
  reverseDirection();
}

class Point{
  PVector pos;
  PVector koku_pos;
  PVector current_pos;
  PVector target_pos;
  Point(){
    float x1 = random(-nSize, nSize);
    float y1 = random(-nSize, nSize);
    float z1 = random(-nSize, nSize);
    float x2 = (random(1) + random(1) + random(1) + random(1) + random(1))/5f;
    float y2 = (random(1) + random(1) + random(1) + random(1) + random(1))/5f;
    float z2 = (random(1) + random(1) + random(1) + random(1) + random(1))/5f;
    x2 = map(x2,0,1,-nSize*1.5f, nSize*1.5f);
    y2 = map(y2,0,1,-nSize*1.5f, nSize*1.5f);
    z2 = map(z2,0,1,-nSize*1.5f, nSize*1.5f);
    pos = new PVector(x1,y1,z1);
    koku_pos = new PVector(x2,y2,z2);
    current_pos = pos.copy();
    target_pos = koku_pos.copy();
  }

  public void update(){
    current_pos.lerp(target_pos, 0.1f);
  }
  public void display(){
    noStroke();
    fill(220, 80, 60, 40);
    pushMatrix();
    translate(current_pos.x,current_pos.y,current_pos.z);
    sphere(5);
    popMatrix();
  }
  public float culDist(){
    return PVector.dist(current_pos,target_pos);
  }

}
  public void settings() {  size(960, 540, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_xxx_random_normal_distribution3D" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
