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
    s.render();
  }
  for (Projectile p : projectiles){
    p.render();
  }
 }
