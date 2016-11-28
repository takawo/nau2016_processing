float grid = 50;
float sw = 15;
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  strokeCap(ROUND);
  stroke(220, 80, 80);
  noFill();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 95);
  strokeWeight(sw);
  for (float y = 0; y < height; y += grid) {
    for (float x = 0; x < width; x += grid) {
      //strokeWeight(1);
      //rect(x, y, grid, grid);
      int random = (int)random(18);
      switch(random) {
      case 0:
        ellipse(x+grid/2, y+grid/2, grid, grid);
        break;
      case 1:
        arc(x+grid/2, y+grid/2, grid, grid, 0, PI*3/2);
        break;
      case 2:
        arc(x+grid/2, y+grid/2, grid, grid, PI/2, TWO_PI);
        break;
      case 3:
        arc(x+grid/2, y+grid/2, grid, grid, PI, PI * 5/2);
        break;
      case 4:
        arc(x+grid/2, y+grid/2, grid, grid, PI*3/2, PI*3);
        break;
      case 5:
        arc(x+grid/2, y+grid/2, grid, grid, 0, PI);
        break;
      case 6:
        arc(x+grid/2, y+grid/2, grid, grid, PI, TWO_PI);
        break;
      case 7:
        arc(x+grid/2, y+grid/2, grid, grid, PI/2, TWO_PI * 3/4);
        break;
      case 8:
        arc(x+grid/2, y+grid/2, grid, grid, TWO_PI * 3/4, TWO_PI * 5/4);
        break;
      case 9:
        arc(x+grid/2, y+grid/2, grid, grid, 0, PI*1/2);
        break;
      case 10:
        arc(x+grid/2, y+grid/2, grid, grid, PI*1/2, PI);
        break;
      case 11:
        arc(x+grid/2, y+grid/2, grid, grid, PI, TWO_PI*3/4);
        break;
      case 12:
        arc(x+grid/2, y+grid/2, grid, grid, TWO_PI*3/4, TWO_PI);
        break;
      case 13:
        arc(x+grid/2, y+grid/2, grid, grid, PI, TWO_PI*3/4);
        arc(x+grid/2, y+grid/2, grid, grid, 0, PI*1/2);
        break;
      case 14:
        arc(x+grid/2, y+grid/2, grid, grid, PI, TWO_PI*3/4);
        arc(x+grid/2, y+grid/2, grid, grid, 0, PI*1/2);
        break;
      case 15:
        arc(x+grid/2, y+grid/2, grid, grid, PI, TWO_PI*3/4);
        arc(x+grid/2, y+grid/2, grid, grid, 0, PI*1/2);
        break;
      case 16:
        ellipse(x+grid/2, y+grid/2, grid/8, grid/8);
        break;
      case 17:
        ellipse(x+grid/2, y+grid/2, grid/8, grid/8);
        ellipse(x+grid/2, y+grid/2, grid, grid);
      }
    }
  }
  noLoop();
}
void mousePressed() {
  redraw();
}