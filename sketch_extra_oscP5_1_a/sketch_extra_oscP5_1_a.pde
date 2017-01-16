import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
PVector p;
PVector vel;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  oscP5 = new OscP5(this, 10000);
  myRemoteLocation = new NetAddress("192.168.179.5", 12000);
  oscP5.plug(this, "getData", "/pattern");
  p = new PVector(width/2,height/2);
  vel = PVector.random2D();
  vel.mult(3);
}

//相手側からのメッセージを受け取るコード。fromAとfromBをそれぞれx, yに代入
public void getData(PVector _p) {
  p = _p.get();
  //println("I got: "+p.x+", "+p.y);
}

void draw() {
  background(0, 0, 100);
  p.add(vel);

  { 
    OscMessage myMessage = new OscMessage("/pattern");
    myMessage.add(p.x); //oscメッセージを追加
    myMessage.add(p.y); //oscメッセージを追加
    //メッセージを受信側に送る
    oscP5.send(myMessage, myRemoteLocation);
  }

  //円を描く
  fill(255);
  ellipse(p.x, p.y, 30, 30);

  if (p.x < 0 || p.x > width*2) {
    vel.x *= -1;
  }
  if (p.y < 0 || p.y > height) {
    vel.y *= -1;
  }
}

//キーを押したら画面は全て黒になる
void keyPressed() {
  background(0);
}
