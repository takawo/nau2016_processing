int num = 100;
float[] numbers = new float[num];
float max = 0;
float min = 10000; 
float offset = 50;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for (int i = 0; i < num; i++) {
    float number = (random(1)+random(1)+random(1)+random(1)+random(1))/5*10000;
    numbers[i] = number;
    max = max(max, number);
    min = min(min, number);
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
  for (int i = 0; i < num; i++) {
    float number = numbers[i];
    float x = map(i, 0, num, 0+offset, width-offset);
    float y = map(number, 0, max, height-offset*2, 0);
    float n = norm(number, min, max);
    n = pow(1-n, 4);
    float hue = map(n, 1, 0, 0, 220);
    fill(hue, 80, 100);
    noStroke();
    rect(x, height-offset, (width-offset*2)/num-2, -y);
    
    textAlign(RIGHT, TOP);
    fill(0, 0, 0);
    pushMatrix();
    translate(x, height-45);
    textSize(8);
    rotate(-PI/2);
    text(i, 0, 0);
    popMatrix();
  }
}