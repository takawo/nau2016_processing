int num = 10;
Rect[] rects = new Rect[num];
// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100, 100); // HSBの色空間を使用
  rectMode(CENTER); //矩形の描画のxyを中心に変更（デフォルトは左上）
  background(0, 0, 100); // 背景を白に

  for(int i = 0; i < rects.length; i++){
    rects[i] = new Rect();
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  // モーションブラー
  fill(0, 0, 100, 1); // 透明度を下げた白で
  rect(width/2, height/2, width, height); //画面サイズの矩形を描画
  // rectModeがデフォルトの場合は、rect(0,0,width,height);
  // 上の2行でモーションブラーがかけられる
  for(int i = 0; i < rects.length; i++){
    rects[i].update();
    rects[i].display();
  }



}

class Rect{
  // プロパティ
  float x,y,w,h,angle;
  float tx,ty,tw,th,tangle;
  color c;
  color tc;
  float easing;

  Rect(){
    initEasing();
  }

  void update(){

    // イージングの関数lerp(a,b,aとbの間の割合0.0〜1.0まで)
    // lerpの値をx,yなどに代入することで、少しずつ動くアニメーションを実現している
    // x,y,size,c,angleなど様々な要素にイージングをかける方法
    x = lerp(x, tx, easing);
    y = lerp(y, ty, easing);
    w = lerp(w, tw, easing);
    h = lerp(h, th, easing);
    c = lerpColor(c, tc, easing); //色もlerpColorという関数でイージング出来る
    angle = lerp(angle, tangle, easing); // 角度もイージング

    // もしターゲットの位置に近づいたら
    // dist関数で2点間の距離を計算できる
    if (dist(x, y, tx, ty) < 1) {
      // つぎのターゲットを設定
      findTarget();
    }
  }
  void display(){
    noStroke(); // 線の色をナシに
    fill(c); // 塗りつぶしの色をcに
    pushMatrix(); // 座標を保存
    translate(x, y); // 原点座標を移動
    rotate(radians(angle));  // 回転
    rect(0, 0, w, h);  // 矩形を描画
    popMatrix();  // 座標を戻す
  }

  // 初期化
  void initEasing() {
    // 初期値をランダムに設定
    x = random(width);
    y = random(height);
    tx = random(width);
    ty = random(height);
    w = random(100);
    tw = random(100);
    h = random(100);
    th = random(100);
    angle = random(TWO_PI);
    tangle = random(TWO_PI);

    easing = random(0.01, 0.08);

    float n = random(360); // 色相をランダムに
    c = color(n, 80, 100);
    tc = color((n+180)%360, 80, 100); // 反対の色を設定
  }

  // ターゲットに近づいたときの処理
  // 次のターゲットを設定する
  void findTarget() {
    x = tx; //近づいているので、x,yそれぞれターゲットの位置に移動させる
    y = ty;
    // tx,tyの値をランダムに（ある程度離れているようにするためにdo-while文を使う）
    do {
      tx = random(width);
      ty = random(height);
      } while (dist(x, y, tx, ty) < 300);

      w = tw;
      tw = random(100);
      h = th;
      th = random(100);

      easing = random(0.01, 0.08);

      c = tc;
      float n = random(360);
      tc = color(n, 80, 100);

      angle = tangle%360;
      tangle = random(360);
    }
  }
