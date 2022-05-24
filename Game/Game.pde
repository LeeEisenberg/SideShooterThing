Player ship;
void setup() {
  size(800, 800);
  ship = new Player();
}

void draw() {
  background(110);
  ship.display();
  ship.move(up, down, left, right);
  ship.move();
}
boolean up, down, left, right;

void keyPressed() {
  setDir(key, true);
}

void keyReleased() {
  setDir(key, false);
}

void setDir(char k, boolean bool) {
  switch (k) {
    case 'w':
      up = bool;
      ship.moveUp(true);
      break;
    case 'a':
      left = bool;
      break;
    case 's':
      down = bool;
      break;
    case 'd':
      right = bool;
      break;
  }
}
