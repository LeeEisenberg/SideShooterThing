import java.util.ArrayList;
int score = 0;
static int hiScore;
Player player;
ArrayList<Projectile> projectiles;
EnemyWave wave;
void setup(){
  size(1000,1500);
  player = new Player();//check this later
  wave = new EnemyWave();//check this later
}
void draw(){
  background(0);
  if (wave.fleet.size() < 1){//creates new wave if previous wave is ded
    wave = new EnemyWave();//check this later
  }
  for (SpaceShip s : wave.fleet){
    s.move();
    s.fire();//make this shoot less often
  }
  for (Projectile p : projectiles){
    p.move();
    p.hitDetec();
  }
  for (SpaceShip s : wave.fleet){
    s.render();
  }
  for (int i = 0; i < projectiles.size(); i++){
    Projectile p = projectiles.get(i);
    p.render();
    if(p.xPos >= width || p.yPos >= height || p.xPos <= 0 || p.yPos <= 0) {
      projectiles.remove(i);
    }
  }
 }
 
void keyPressed() {
  ship.setDir(key, true);
} 

void keyReleased() {
  ship.setDir(key, false);
}
