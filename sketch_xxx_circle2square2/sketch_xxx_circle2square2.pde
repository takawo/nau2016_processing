// color reference : https://goo.gl/31Q13x

int num = 100;
ArrayList<Box> boxes = new ArrayList<Box>();

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  float sizeGrid = random(40, 60);
  for (float y = 0; y <= height; y += sizeGrid) {
    for (float x = 0; x <= width; x += sizeGrid) {
      Box box = new Box(sizeGrid/2 + x, sizeGrid/2 + y, sizeGrid);
      boxes.add(box);
    }
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  fill(206, 72, 47, 50);
  rect(0, 0, width, height);
  for (Box b : boxes) {
    b.update();
    b.display();
  }
}

class Box {
  float x, y;
  float sizeGrid;
  float easing;
  float sizeMin;
  float sizeMax;
  boolean isForward;
  float sizeCurrent;
  color c;
  color[] colors = {color(186, 87, 64), color(182, 29, 95), color(85, 11, 100), color(32, 100, 92)};
  Box(float _x, float _y, float _sizeGrid) {
    x = _x;
    y = _y;
    sizeGrid = _sizeGrid/2;
    easing = random(0.01, 0.1);
    sizeMin = 0;
    sizeMax = sqrt(sizeGrid * sizeGrid + sizeGrid * sizeGrid);
    c = colors[int(random(colors.length))];
    if (random(1) > 0.5) {
      isForward = true;
      sizeCurrent = sizeMin;
    } else {
      isForward = false;
      sizeCurrent = sizeMax;
    }
  }

  void update() {
    float sizeTarget;
    if (isForward) {
      sizeTarget = sizeMax;
    } else {
      sizeTarget = sizeMin;
    }
    sizeCurrent = lerp(sizeCurrent, sizeTarget, easing);
    if (abs(sizeCurrent - sizeTarget) < 1) {
      if (isForward) {
        sizeTarget = random(sizeMin, sizeMin+sizeMax/10);
      } else {
        sizeTarget = random(sizeMax/4, sizeMax);
        c = colors[int(random(colors.length))];
      }
      isForward = !isForward;
      easing = random(0.05, 0.1);
    }
  }

  void display() {
    noStroke();
    fill(c);
    pushMatrix();
    translate(x, y);
    beginShape();
    for (float angle = 0; angle < 360; angle += 10) {
      float theta = radians(angle);
      float x1 = cos(theta) * sizeCurrent;
      float y1 = sin(theta) * sizeCurrent;
      x1 = constrain(x1, -sizeGrid, sizeGrid);
      y1 = constrain(y1, -sizeGrid, sizeGrid);
      vertex(x1, y1);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
