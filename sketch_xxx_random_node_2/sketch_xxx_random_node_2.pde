int num = 200;
ArrayList<Mover> movers = new ArrayList<Mover>();
;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
  background(0, 0, 100);
  smooth();
  for (int i = 0; i < num; i++) {
    float x = i * width/num;
    float y = height/2;
    float diameter = width/num;
    Mover m = new Mover(x, y, diameter);
    movers.add(m);
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  noStroke();
  fill(0, 0, 100, 5);
  rect(0, 0, width, height);
  //beginShape();
  for (Mover m : movers) {
    m.update();
    m.display();
    //vertex(m.x,m.y);
  }
  //stroke(0,0,10);
  //strokeWeight(0.1);
  //noFill();
  //endShape();
}

class Mover {
  float x;
  float y;
  float ty;
  float diameter;
  float offset;
  float easing = 0.01;

  Mover(float _x, float _y, float _diameter) {
    x = _x;
    y = _y;
    diameter = _diameter;
    offset = diameter/2;
    y = random(offset, height-offset);
    ty = random(offset, height-offset);
  }
  void update() {
    y = lerp(y, ty, easing);
    if (abs(ty-y) < 0.1) {
      y = ty;
      ty = random(offset, height-offset);
    }
  }

  void display() {
    fill(0, 0, 50);
    noStroke();
    ellipse(x, y, diameter, diameter);

    noFill();
    stroke(0, 0, 60);
    strokeWeight(1);
    ellipse(x, ty, diameter, diameter);
  }
}