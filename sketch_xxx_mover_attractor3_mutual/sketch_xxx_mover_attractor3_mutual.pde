float g = 0.4;
int num = 50;
ArrayList<Mover> movers = new ArrayList<Mover>();
// setup関数 : 初回1度だけ実行される
void setup(){
  size(960,540); // ウィンドウサイズを960px,540pxに
  colorMode(HSB,360,100,100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに
  for(int i = 0; i < num; i++){
    Mover m = new Mover(random(0.1,2),random(width),random(height));
    movers.add(m);
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw(){
  background(0,0,100);
  for(int i = 0; i < movers.size(); i++){
    for(int j = 0; j < movers.size(); j++){
      if(i != j){
        PVector force = movers.get(j).attract(movers.get(i));
        movers.get(i).applyForce(force);
      }
    }
    movers.get(i).update();
    movers.get(i).display();
  }
}

class Mover{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  color c;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(random(200,240),80,100);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, mass*24, mass*24);
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(position, m.position);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }


}
