void setup(){
  size(200,200);
  background(0,128,255);
}


void draw(){
  surface.setLocation((-width+frameCount*10)%displayWidth,displayHeight/2-height/2);
}