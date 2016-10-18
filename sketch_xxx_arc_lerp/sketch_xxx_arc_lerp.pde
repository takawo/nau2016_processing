ArrayList<Arc> arcs = new ArrayList<Arc>();

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100);
  for (float r = 100; r < 960; r += 60) {
    Arc arc = new Arc(r);
    arcs.add(arc);
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  fill(0, 0, 100, 15);
  rect(0, 0, width, height);
  for (Arc arc : arcs) {
    arc.draw();
  }
}

class Arc {
  boolean isClockWise;
  float startAngle;
  float targetAngle;
  float currentAngle;
  float r;
  float easing;
  color c;
  float sw = 5;
  Arc(float r) {
    this.r = r;
    setAngle();
  }

  void draw() {
    pushStyle();
    noFill();
    stroke(c);
    strokeWeight(sw);
    pushMatrix();
    translate(width/2, height/2);
    rotate(frameCount*-easing);
    if (isClockWise) {
      arc(0, 0, r, r, currentAngle, targetAngle);
      currentAngle = lerp(currentAngle, targetAngle, easing);
      if (abs(currentAngle-targetAngle) < 0.01) {
        setAngle();
      }
    } else {
      arc(0, 0, 200, 200, startAngle, currentAngle);
      currentAngle = lerp(currentAngle, startAngle, easing);
      if (abs(currentAngle-startAngle) < 0.01) {
        setAngle();
      }
    }
    popMatrix();
    popStyle();
  }

  void setAngle() {
    easing = random(0.01, 0.0001);
    c = color(random(360), 80, 100);
    float r = random(1);
    if (r > 0.5) {
      isClockWise = true;
    } else {
      isClockWise = false;
    }
    if (isClockWise) {
      startAngle = random(TWO_PI);
      targetAngle = startAngle + random(TWO_PI);
      currentAngle = startAngle;
      if (startAngle > targetAngle) {
        float tmp = startAngle;
        startAngle = targetAngle;
        targetAngle = tmp;
      }
    } else {
      targetAngle = random(TWO_PI);
      startAngle = targetAngle + random(TWO_PI);
      currentAngle = targetAngle;
      if (startAngle > targetAngle) {
        float tmp = startAngle;
        startAngle = targetAngle;
        targetAngle = tmp;
      }
    }
  }
}