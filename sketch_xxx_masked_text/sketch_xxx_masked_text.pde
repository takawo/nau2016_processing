PGraphics mask;
PGraphics graphic;
String txt_mask = "text is masked. text is masked. text is masked. text is masked.";
String txt_xxxx = "text is xxxxxx. text is xxxxxx. text is xxxxxx. text is xxxxxx.";

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  graphic = createGraphics(width, height);
  graphic.beginDraw();
  graphic.colorMode(HSB, 360, 100, 100);
  graphic.background(220, 80, 100);
  graphic.textAlign(CENTER, CENTER);
  graphic.fill(0, 0, 100);
  graphic.textSize(30);
  graphic.text(txt_mask, width/2, height/2);
  graphic.endDraw();

  mask = createGraphics(width, height);

  textAlign(CENTER, CENTER);
  fill(0, 0, 0);
  textSize(30);
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
  background(0, 0, 80);

  text(txt_xxxx, width/2, height/2);

  mask.beginDraw();
  mask.colorMode(HSB, 360, 100, 100);
  mask.background(0, 0, 0);
  mask.fill(0, 0, 100);
  mask.noStroke();
  mask.ellipse((-100+frameCount*3)%(width+100), height/2+sin(frameCount*0.05)*50, 100, 100);
  mask.endDraw();
  graphic.mask(mask);


  image(graphic, 0, 0);
}