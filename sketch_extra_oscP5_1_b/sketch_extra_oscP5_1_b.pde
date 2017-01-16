//This code has been arranged by Yasushi Noguchi. Last updated on July 1, 2009.
//oscP5plug by andreas schlegel

//open sound controlのライブラリを追加する（必須）
import oscP5.*;
import netP5.*;

OscP5 oscP5;    //受信用の変数
NetAddress myRemoteLocation;    //送信用のアドレスを保持する変数

float x, y;    //相手側のx, y座標を格納するための変数

void setup() {
  size(400, 400);
  colorMode(HSB,360,100,100);
  background(0);
  noStroke();

  //受信用の変数。右の数字はポート番号。送信側のポート番号とあわせる。
  oscP5 = new OscP5(this, 12000);

  //送信用オブジェクト。左側の数字が相手のIPアドレス、右側が相手のポート番号。
  myRemoteLocation = new NetAddress("192.168.179.5", 10000);

  oscP5.plug(this, "getData", "/pattern");
}

//相手側からのメッセージを受け取るコード。fromAとfromBをそれぞれx, yに代入
public void getData(float fromA, float fromB) {
  x = fromA; 
  y = fromB;
  println("I got: "+fromA+", "+fromB);
}

void draw() {
  background(0, 0, 50);
  translate(-400,0);
  OscMessage myMessage = new OscMessage("/pattern");

  myMessage.add(x); //oscメッセージを追加
  myMessage.add(y); //oscメッセージを追加

  //メッセージを受信側に送る
  oscP5.send(myMessage, myRemoteLocation); 



  //円を描く
  fill(255);
  ellipse(x, y, 30, 30);
}

//キーを押したら画面は全て黒になる
void keyPressed() {
  background(0);
}
