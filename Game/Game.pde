import java.util.ArrayList;
int score = 0;
static int hiScore;
Player player;
ArrayList<Projectile> projectiles;
EnemyWave wave;
int level;
PImage[] sprites;
PImage background;
boolean specialAnim;
void setup(){
  size(1500,1000);
  player = new Player();
  wave = new EnemyWave();
  projectiles = new ArrayList<Projectile>();
  level = 0;
  sprites = new PImage[4];
  for(int i = 0; i < 4; i++) {
      sprites[i] = loadImage("sprites/proj"+(i+1)+".png");
  }
  background = loadImage("sprites/background.jpg");
  background.resize(width,height);
}
void draw(){
  image(background, 750, 500);
  fill(255-player.HP, 255-2*(100-player.HP), 0);
  rect(750-player.HP*2.5, 0, player.HP*5, 100);
  rect(1100, 50, 200, 50);
  rect(1100, 50, 2*player.cannon.charge, 50);
  
  if (wave.fleet.size() < 1){//creates new wave if previous wave is ded
    level++;
    wave = new EnemyWave(level % 2);//check this later
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
  for (int x = 0; x < wave.fleet.size(); x++){
    if (wave.fleet.get(x).x < 0){
      player.HP = 0;
      x = wave.fleet.size();
    }
  }
  if (player.HP < 1){
    player = new Player();
    wave = new EnemyWave();
    projectiles = new ArrayList<Projectile>();
    level = 0;
  }
  if(player.cannon.specialTimer > 0) {
    player.cannon.specialTimer--;
  }
  player.cannon.fire(player.x, player.y);
  textSize(100);
  text("Wave: " + (level+1), 20, 100);
  
}
 
void keyPressed() {
  player.setDir(key, true);
  if(key == CODED && keyCode == SHIFT) {
    player.dash();
  }
} 

void keyReleased() {
  player.setDir(key, false);
}

void mousePressed(){
  if (mouseButton == LEFT){
    player.setDir(' ', true);
  }
  if (mouseButton == RIGHT){
    player.setDir('f', true);
  }
}

void mouseReleased(){
  if (mouseButton == LEFT){
    player.setDir(' ', false);
  }
  if (mouseButton == RIGHT){
    player.setDir('f', false);
  }
}
