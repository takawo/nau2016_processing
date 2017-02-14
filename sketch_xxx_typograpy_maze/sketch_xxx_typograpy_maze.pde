PGraphics graphic;
ArrayList<PVector> points = new ArrayList<PVector>();
int grid = 10;

// setup関数 : 初回1度だけ実行される
void setup() {
    size(960, 540); // ウィンドウサイズを960px,540pxに
    colorMode(HSB, 360, 100, 100, 100); // HSBでの色指定にする
    smooth(); // 描画を滑らかに

    PFont font = createFont("YuGothic-Bold", 350);

    graphic = createGraphics(width, height);
    graphic.beginDraw();
    graphic.colorMode(HSB, 360, 100, 100, 100);
    graphic.background(0, 0, 100);
    graphic.textAlign(CENTER, CENTER);
    graphic.textFont(font, 350);
    graphic.fill(0, 0, 0);
    graphic.text("地獄", width/2, height/2);
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
        if(random(1) < 0.5){
            strokeWeight(grid/2);
            stroke(120,80,100,50);
            line(p.x,p.y,p.x+grid,p.y+grid);
        }else{
            strokeWeight(grid/4);
            stroke(0,80,100,50);
            line(p.x,p.y+grid,p.x+grid,p.y);
        }
    }
    noLoop();
}

void mousePressed(){
    redraw();
}