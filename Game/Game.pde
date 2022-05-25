Projectile test;
void setup(){
  size(800,800);
  test = new Projectile();
}
void draw(){
  background(0);
  test.move();
  test.render();
}
