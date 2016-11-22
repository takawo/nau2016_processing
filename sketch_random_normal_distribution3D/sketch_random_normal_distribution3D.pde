float loopCount = 180;
float nSize = 400; 
boolean isKoku;
int num = 50000;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  isKoku = false;
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, -500);
  rotateX(frameCount/loopCount/4*TWO_PI);
  rotateY(frameCount/loopCount/16*TWO_PI);
  rotateZ(frameCount/loopCount/16*TWO_PI);
  stroke(0, 0, 30);
  noFill();
  line(-nSize * 10, 0, 0, nSize*10, 0, 0);
  line(0, -nSize * 10, 0, 0, nSize*10, 0);
  line(0, 0, -nSize * 10, 0, 0, nSize*10);
  //box(100);
  if (isKoku) {
    makeRandomWithKoku();
  } else {
    makeRandom();
  }
}

void makeRandom() {
  for (int i =0; i < num; i++) {
    float x = random(-nSize, nSize);  
    float y = random(-nSize, nSize);  
    float z = random(-nSize, nSize);
    stroke(0, 0, 100);
    pushMatrix();
    translate(x, y, z);
    point(0, 0);
    popMatrix();
  }
}

void makeRandomWithKoku() {
  for (int i =0; i < num; i++) {
    float x = (random(1) + random(1) + random(1) + random(1) + random(1))/5f;  
    float y = (random(1) + random(1) + random(1) + random(1) + random(1))/5f;  
    float z = (random(1) + random(1) + random(1) + random(1) + random(1))/5f;
    x = map(x,0,1,-nSize,nSize);
    y = map(y,0,1,-nSize,nSize);
    z = map(z,0,1,-nSize,nSize);
    stroke(0, 0, 100);
    pushMatrix();
    translate(x, y, z);
    point(0, 0);
    popMatrix();
  }
}

void mousePressed() {
  isKoku = !isKoku;
}