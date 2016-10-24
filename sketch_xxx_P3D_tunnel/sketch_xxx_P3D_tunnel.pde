// 変数

float distance = 0f;
float speed = 5;
float objStep = 40;

color backgroundColor,strokeColor;
boolean useRect;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540,P3D); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  rectMode(CENTER);

  mousePressed();
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(backgroundColor);
  translate(width/2,height/2);
  float camX = map(mouseX,0,width,-150,150);
  float camY = map(mouseY,0,height,-150,150);

  camera(camX,camY,0,0,0,-100,0,1,0);
  stroke(strokeColor);
  strokeWeight(2);
  noFill();

  for(float depth = 0; depth > -1500; depth -= objStep){
    pushMatrix();
    translate(0,0,depth + distance%objStep);
    if(useRect){
      rect(0,0,200,200);
    }else{
      ellipse(0,0,200,200);
    }
    popMatrix();
  }
  distance += speed;
  if(distance > objStep){
    distance -= objStep;
  }

}

// mouseMoved関数 : マウスがクリックされたときに実行される
void mouseMoved(){

}

// mousePressed関数 : マウスがクリックされたときに実行される
void mousePressed(){
  backgroundColor = color(random(360),80,random(10,50));
  strokeColor = color((hue(backgroundColor)+180)%360,80,100);
  useRect = random(1) < 0.5 ? true : false;
}

// mouseReleased関数 : クリックが解放されたときに実行される
void mouseReleased(){

}

// mouseDraged関数 : マウスがドラッグされたときに実行される
void mouseDragged(){

}
