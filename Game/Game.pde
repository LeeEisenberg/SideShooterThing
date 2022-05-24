Player ship;
void setup() {
  size(800, 800);
  ship = new Player();
}

void draw() {
  background(110);
  
  ship.move(up, down, left, right);
  ship.display();
  println("w: "+up);
  println("a: "+left);
  println("s: "+down);
  println("d: "+right);
  println(ship.dX);
  println(ship.dY);
}
boolean up, down, left, right;

void keyPressed() {
  setDir(key, true);
} 

void keyReleased() {
  setDir(key, false);
}

void setDir(int k, boolean bool) {
  switch (k) {
    case 'w':
      up = bool;
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
