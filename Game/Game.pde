Player ship;
void setup() {
  size(800, 800);
  ship = new Player();
}

void draw() {
  background(110);
  ship.display();
}

void keyPressed() {
  if(key == 'w') {
    ship.moveUp(true);
  }
  if(key == 's') {
    ship.moveDown(true);
  }
  if(key == 'a') {
    ship.moveLeft(true);
  }
  if(key == 'd') {
    ship.moveRight(true);
  }
  ship.move();
}

void keyReleased() {
  if(key == 'w') {
    ship.moveUp(false);
  }
  if(key == 's') {
    ship.moveDown(false);
  }
  if(key == 'a') {
    ship.moveLeft(false);
  }
  if(key == 'd') {
    ship.moveRight(false);
  }
}
