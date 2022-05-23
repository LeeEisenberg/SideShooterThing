import java.util.ArrayList;
int score;
static int hiScore;
Player player;
ArrayList<Projectile> projectiles;
ArrayList<SpaceShip> ships;
EnemyWave wave;
void setup(){
  size(1000,1500);
  player = new Player();//INITIALIZE THIS COMPLETELY LATER
}
