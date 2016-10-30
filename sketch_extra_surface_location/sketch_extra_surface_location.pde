void setup(){
  size(200,200);
  background(0,128,255);
}


void draw(){
  int x = (-width+frameCount*10)%displayWidth-200;
  surface.setLocation(x,displayHeight/2-height/2-100);
}
