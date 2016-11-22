import gifAnimation.*;

ArrayList<Point> points = new ArrayList<Point>();
float nSize = 400;
boolean isKoku;
int num = 1000;

// 変数
GifMaker gifExport;
float gifCount = 90;
boolean isRecord = false;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540, P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100,100); // HSBでの色指定にする
  blendMode(ADD);
  smooth(); // 描画を滑らかに
  sphereDetail(0);
  isKoku = false;

  for(int i = 0; i < num; i++){
    Point p = new Point();
    points.add(p);
  }
  gifInit();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, -500);
  rotateX(frameCount/gifCount/4*TWO_PI);
  rotateY(frameCount/gifCount/16*TWO_PI);
  rotateZ(frameCount/gifCount/16*TWO_PI);
  lights();
  ambientLight(0,0,80);
  stroke(220, 80, 40, 30);
  strokeWeight(0.5);
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
  if(sum < 1.0){
    reverseDirection();
  }
  gifDraw();
}

void gifInit() {
  if (isRecord == false) {
    return;
  }
  gifExport = new GifMaker(this, getClass().getSimpleName() +".gif"); // ファイル名のGIFアニメーションを作成
  gifExport.setRepeat(0); // エンドレス再生
  gifExport.setQuality(8); // クオリティ(デフォルト10)
  gifExport.setDelay(33); // アニメーションの間隔を30ms(33fps)に
}

void gifDraw() {
  if (isRecord == false) {
    return;
  }
  //GIFアニメーションの保存
  if (frameCount <= gifCount) {
    gifExport.addFrame(); // フレームを追加
  } else {
    gifExport.finish(); // 終了してファイル保存
    exit();
  }
}

void reverseDirection(){
  for(Point p:points){
    if(isKoku){
      p.target_pos = p.pos.copy();
    }else{
      p.target_pos = p.koku_pos.copy();
    }
  }
  isKoku = !isKoku;
}

void mousePressed() {
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
    x2 = map(x2,0,1,-nSize*1.5, nSize*1.5);
    y2 = map(y2,0,1,-nSize*1.5, nSize*1.5);
    z2 = map(z2,0,1,-nSize*1.5, nSize*1.5);
    pos = new PVector(x1,y1,z1);
    koku_pos = new PVector(x2,y2,z2);
    current_pos = pos.copy();
    target_pos = koku_pos.copy();
  }

  void update(){
    current_pos.lerp(target_pos, 0.1);
  }
  void display(){
    noStroke();
    fill(220, 80, 60, 40);
    pushMatrix();
    translate(current_pos.x,current_pos.y,current_pos.z);
    sphere(5);
    popMatrix();
  }
  float culDist(){
    return PVector.dist(current_pos,target_pos);
  }

}
