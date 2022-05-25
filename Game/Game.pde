Player ship;
void setup() {
  size(800, 800);
  ship = new Player();
}

void draw() {
  background(110);
  
  ship.move(ship.up, ship.down, ship.left, ship.right);
  ship.render();
  println(ship.dX);
  println(ship.dY);
}

void keyPressed() {
  ship.setDir(key, true);
} 

void keyReleased() {
  ship.setDir(key, false);
}
