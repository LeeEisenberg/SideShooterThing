import java.util.ArrayList;
int score = 0;
static int hiScore;
Player player;
ArrayList<Projectile> projectiles;
EnemyWave wave;
void setup(){
  size(1500,1000);
  player = new Player();
  wave = new EnemyWave();
  projectiles = new ArrayList<Projectile>();
}
void draw(){
  background(0);
  if (wave.fleet.size() < 1){//creates new wave if previous wave is ded
    wave = new EnemyWave();//check this later
  }
  for (int x = 0; x < projectiles.size(); x++){
    projectiles.get(x).move();
  }
  wave.move();
  player.render();
  for (int x = 0; x < wave.fleet.size(); x++){
    wave.fleet.get(x).render();
  }
  for (int i = 0; i < projectiles.size(); i++){
    Projectile p = projectiles.get(i);
    p.render();
    if(p.xPos >= width || p.yPos >= height || p.xPos <= 0 || p.yPos <= 0) {
      projectiles.remove(i);
    }
  }
  if (player.HP < 1){
    player = new Player();
    wave = new EnemyWave();
    projectiles = new ArrayList<Projectile>();
  }
}
 
void keyPressed() {
  player.setDir(key, true);
} 

void keyReleased() {
  player.setDir(key, false);
}
