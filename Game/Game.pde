SpaceShip ship;
void setup() {
  size(800, 800);
  ship = new SpaceShip();
}

void draw() {
  background(110);
  ship.display();
}

void keyPressed() {
  if(key == 'w') {
    ship.move(0, -5);
  }
  if(key == 's') {
    ship.move(0, 5);
  }
  if(key == 'a') {
    ship.move(-5, 0);
  }
  if(key == 'd') {
    ship.move(5, 0);
  }
}
