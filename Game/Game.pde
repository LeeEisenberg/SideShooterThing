int score = 0;
static int hiScore;
Player ship;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
EnemyWave wave;
void setup(){
  size(1000,1500);
  ship = new Player();//check this later
  wave = new EnemyWave();//check this later
}
void draw(){
  background(100);
  ship.render();
  ship.move();
  for (int i = 0; i < projectiles.size(); i++){
    Projectile p = projectiles.get(i);
    p.move();
    p.render();
    if(p.xPos >= width || p.yPos >= height || p.xPos <= 0 || p.yPos <= 0) {
      projectiles.remove(i);
    }
  }
  println(projectiles.size());
 }
 
void keyPressed() {
  ship.setDir(key, true);
} 

void keyReleased() {
  ship.setDir(key, false);
}
