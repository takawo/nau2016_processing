int num = 50;
ArrayList<Mover> movers = new ArrayList<Mover>();
Attractor attractor;

// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for(int i = 0; i < num; i++){
    Mover mover = new Mover();
    movers.add(mover);
  }
  attractor = new Attractor();

}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,100);
  for(Mover mover:movers){

  PVector force = attractor.attract(mover);
  mover.applyForce(force);
  mover.update();

  attractor.drag();
  attractor.hover(mouseX,mouseY);
  attractor.display();
  mover.display();
  }
}

void mousePressed(){
  attractor.clicked(mouseX,mouseY);
}
void mouseReleased(){
  attractor.stopDragging();
}

class Attractor{
  float mass;
  float G;
  PVector position;
  boolean dragging = false;
  boolean rollover = false;
  PVector dragOffset;

  Attractor(){
    position = new PVector(width/2,height/2);
    mass = 20;
    G = 1;
    dragOffset = new PVector(0,0);
  }

  PVector attract(Mover m){
    PVector force = PVector.sub(position,m.position);
    float d = force.mag();
    d = constrain(d,5.0,25.0);
    force.normalize();
    float strength = (G * m.mass * m.mass) / (d * d);
    force.mult(strength);
    return force;
  }

  void display(){
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0,0,0);
    if(dragging) fill(0,0,50);
    else if(rollover) fill(0,0,60);
    ellipse(position.x,position.y,mass*2,mass*2);
  }
  void clicked(int mx,int my){
    float d = dist(mx,my,position.x,position.y);
    if(d < mass){
      dragging = true;
      dragOffset.x = position.x - mx;
      dragOffset.y = position.y - my;
    }
  }
  void hover(int mx,int my){
    float d = dist(mx,my,position.x,position.y);
    if(d < mass){
      rollover = true;
    }
  }
  void drag() {
    if (dragging) {
      position.x = mouseX + dragOffset.x;
      position.y = mouseY + dragOffset.y;
    }
  }

  void stopDragging(){
    dragging = false;
  }
}

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    position = new PVector(random(width),random(height));
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = 10;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x,position.y,mass*2,mass*2);
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
      } else if (position.x < 0) {
        position.x = width;
      }

      if (position.y > height) {
        velocity.y *= -1;
        position.y = height;
      }

    }

  }
