PGraphics graphic;
ArrayList<PVector> points = new ArrayList<PVector>();
int grid = 5;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  PFont font = createFont("YuGothic-Bold", 100);

  graphic = createGraphics(width, height);
  graphic.beginDraw();
  graphic.colorMode(HSB, 360, 100, 100, 100);
  graphic.background(0, 0, 100);
  graphic.textAlign(CENTER, CENTER);
  graphic.textFont(font, 100);
  graphic.fill(0, 0, 0);
  graphic.text("TEXT\nIS\nSTRIPED.", width/2, height/2);
  graphic.endDraw();

  for (int y = 0; y < height; y += grid) {
    for (int x = 0; x < width; x += grid) {
      if (brightness(graphic.get(x, y)) < 1) {
        fill(0, 0, 0);
        noStroke();
        ellipse(x, y, grid, grid);
        points.add(new PVector(x, y));
      }
    }
  }
}


// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 100);
    for (PVector p : points) {
      stroke(0,0,0);
      for(int x = (int)p.x; x < p.x+grid; x +=grid){
        stroke(120,80,100);
        line(x, p.y-5, x+grid, p.y+5);
        stroke(0,80,100);
        line(x-5, p.y-5, x+5, p.y+5);
      }
    }
    noLoop();
  }
