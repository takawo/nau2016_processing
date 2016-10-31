int num = 5;
ArrayList<Waves> ws;

void setup() {
  size(960, 540);
  colorMode(HSB, 360, 100, 100);
  frameRate(30);
  smooth();
  ws = new ArrayList<Waves>();
  for (int i = 0; i < num+1; i++) {
    ws.add(new Waves(height/num*i));
  }
}

void draw() {
  background(0, 0, 100);
  for (Waves w : ws) {
    w.draw();
  }
}

public class Waves {
  Wave wave1;
  Wave wave2;
  float y;
  public Waves(float y) {
    wave1 = new Wave();
    wave2 = new Wave();
    this.y = y;
  }
  public void draw() {
    pushMatrix();
    translate(0, y);
    noFill();
    stroke(220, 80, 100);
    strokeWeight(4);

    beginShape();
    for (int x = 0; x <= width; x++) {
      float a = x * 0.01 + frameCount*0.1;
      float h = wave1.getValue(a);
      vertex(x, h);
    }
    endShape();
    beginShape();
    for (int x = 0; x <= width; x++) {
      float a = x * 0.01 + frameCount*0.1;
      float h = wave2.getValue(a);
      vertex(x, h);
    }
    endShape();

    strokeWeight(2);
    for (int x = 0; x <= width; x+= 5) {
      float a = x * 0.01 + frameCount*0.1;
      float h1 = wave1.getValue(a);
      float h2 = wave2.getValue(a);
      line(x, h1, x, h2);
    }
    popMatrix();
  }
}
public class Wave {
  ArrayList<Float> amps;
  ArrayList<Float> freqs;
  ArrayList<Float> phases;
  Wave() {
    amps = new ArrayList<Float>();
    freqs = new ArrayList<Float>();
    phases = new ArrayList<Float>();
    for (int i = 0; i < 5; i++) {
      amps.add(random(25));
      freqs.add(random(10));
      phases.add(random(TWO_PI));
    }
  }
  float getValue(float t) {
    float value = 0;
    for (int i = 0; i < 5; i++) {
      value += amps.get(i)*sin(freqs.get(i)*t + phases.get(i));
    }
    return value;
  }
}
