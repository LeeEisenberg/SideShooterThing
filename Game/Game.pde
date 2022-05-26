Player ship;
Projectile bullet;
ArrayList<Projectile> bullets;
void setup() {
  size(800, 800);
  ship = new Player();
  bullet = new Projectile(10, 400, 400, -2, 0, 10);
  bullets = new ArrayList<Projectile>();
  bullets.add(bullet);
}

void draw() {
  background(110);
  
  ship.move(ship.up, ship.down, ship.left, ship.right);
  ship.render();
  bullet.render();
  println();
  println(ship.HP);
  println();
}

void keyPressed() {
  ship.setDir(key, true);
  if(key == CODED && keyCode == UP) {
    bullet.move();
  }
} 

void keyReleased() {
  ship.setDir(key, false);
}
