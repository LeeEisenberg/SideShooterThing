import java.util.ArrayList;
import processing.sound.*;

int score = 0;
static int hiScore;
static Player player;
ArrayList<Projectile> projectiles;
ArrayDeque<SpaceShip> toExplode;
ArrayList<Explosion> gonnaexplodethis;
EnemyWave wave;
int level;
PImage[] sprites;
PImage powerup;
PImage[] piercing;
PImage background;
PImage special[];
PImage flash;
PImage[] lightning;
PImage light;
PImage[] rockets;
PImage[] explosions;
SoundFile cannonyell;
SoundFile sundaybest;
boolean specialAnim;
int frame;
boolean startMenu;
boolean restartMenu;
boolean loadoutMenu;

void setup(){
  frameRate(60);
  size(1500,1000);
  textSize(100);
  startMenu = true;
  player = new Player(1);
  toExplode = new ArrayDeque();
  gonnaexplodethis = new ArrayList<Explosion>();
  wave = new EnemyWave((int)random(3));
  projectiles = new ArrayList<Projectile>();
  level = 0;
  sprites = new PImage[4];
  for(int i = 0; i < 4; i++) {
      sprites[i] = loadImage("sprites/proj"+(i+1)+".png");
  }
  powerup = loadImage("sprites/powerup.png");
  special = new PImage[75];
  for(int i = 0; i<=9; i++) {
    special[i] = loadImage("sprites/flash"+(i+1)+".png");
  }
  piercing = new PImage[4];
  for(int i = 0; i < 4; i++) {
    piercing[i] = loadImage("sprites/pierce"+(i+1)+".png");
  }
  rockets = new PImage[4];
  for(int i = 0; i < 4; i++) {
    rockets[i] = loadImage("sprites/rocket" +(i+1)+".png");
  }
  explosions = new PImage[12];
  for(int i = 0; i < 12; i++) {
    explosions[i] = loadImage("sprites/explode"+(i+1)+".png");
  }
  background = loadImage("sprites/background.jpg");
  background.resize(width,height);
  specialAnim = false;
  cannonyell = new SoundFile(this, "sounds/protoncannon.mp3");
  sundaybest = new SoundFile(this, "sounds/heresmysundaybest.mp3");
}
void draw(){
    if(!startMenu && !restartMenu && !loadoutMenu){
      rectMode(CORNER);
      textAlign(LEFT);
      image(background, 750, 500);
      textSize(100);
      fill(255);
      text("Wave: " + (level+1), 20, 100);
      fill(128);
      rect(1100, 50, 200, 50);
      fill(0, 0, 255);
      rect(1100, 50, 2*player.cannon.charge, 50);
      fill(255-player.HP, 255-2*(100-player.HP), 0);
      rect(750-player.HP*2.5, 0, player.HP*5, 100);
      
      if (wave.fleet.size() < 1){//creates new wave if previous wave is ded
        level++;
        wave = new EnemyWave((int) random(3));//check this later
      }
      if(!specialAnim){
        for (int x = 0; x < projectiles.size(); x++){
          projectiles.get(x).move();
        }
        wave.move();
        if(player.cannon.specialTimer > 0) {
        player.cannon.specialTimer--;
      }
      player.cannon.fire(player.x, player.y);
      }
      player.render();
      if(player.x < 0) {
        player.x = 0;
      }
      if(player.y < 0) {
        player.y = 0;
      }
      if(player.x > width) {
        player.x = width;
      }
      if(player.y > height) {
        player.y = height;
      }
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
        wave = new EnemyWave();
        projectiles = new ArrayList<Projectile>();
        level = 0;
        player.HP = 100;
      }
      
      if(toExplode.size() >=1) {
        for(int i = 0; i < toExplode.size(); i++) {
          gonnaexplodethis.add(new Explosion(toExplode.peek().x, toExplode.peek().y, (int)(toExplode.peek().size/25)));
          toExplode.removeFirst();
        }
      }
      if(gonnaexplodethis.size() > 0) {
        for(int i = 0; i < gonnaexplodethis.size(); i++) {
          Explosion e = gonnaexplodethis.get(i);
          e.exAnim();
          if(e.done) {
            gonnaexplodethis.remove(e);
          }
        }
    if(specialAnim) {
      frameRate(15);
      frame = (frame)%10;
      flash = special[frame];
      image(flash, player.x, player.y);
     
      
      frame++;
      if(frame == 10) {
        specialAnim = false;
        frameRate(60);
      }
      
      }
    }
  }
  if(startMenu) {
    background(0);
    fill(255);
    rectMode(CENTER);
    rect(width/4, height*3/4, 500, 100);
    rect(width*3/4, height*3/4, 500, 100);
    textAlign(CENTER);
    text("SPACE FIGHTER", width/2, height*3/10);
    fill(0);
    text("Start?", width/4, height*3/4+37.5);
    text("Exit", width*3/4, height*3/4+37.5);
  }
  if(loadoutMenu) {
    background(0);
    fill(255);
    textAlign(CENTER);
    rectMode(CENTER);
    textSize(100);
    text("PICK YOUR LOADOUT", width/2, height*3/10);
    textSize(50);
    rect(width/4, height/2+11, 500, 200);
    rect(width*3/4, height/2+11, 500, 200);
    fill(0);
    text("Proton Cannon", width/4, height/2);
    text("Piercing Shot", width/4, height/2 + 50);
    text("Missle Barrage", width*3/4, height/2);
    text("Homing Missle", width*3/4, height/2+50);
  }
}
 
void keyPressed() {
  player.setDir(key, true);
  if(key == CODED && keyCode == SHIFT) {
    player.dash();
  }
  //case ' ':
  //      weapon.fire(x, y, true);
  //      break;
  //    case 'e':
  //      cannon.activate((int)x, (int)y);
  //      break;
  //    case 'f':
  //      secondary.fire(x, y, true);
  //      break;
  if(key == ' ' && !player.cannon.active) {
    player.weapon.fire(player.x, player.y, true);
  }
  if(key == 'e') {
    player.cannon.activate((int)player.x, (int)player.y);
  }
  if(key == 'f') {
    player.secondary.fire(player.x, player.y, true);
  }
} 

void keyReleased() {
  player.setDir(key, false);
}

void mousePressed(){
  if(startMenu) {
    if(mouseY <= height*3/4 +50 && mouseY >= height*3/4 - 50) {
      if(mouseX <= width/4 + 250 && mouseX >= width/4 -250) {
        startMenu = false;
        loadoutMenu = true;
      }
      if(mouseX <= width*3/4 + 250 && mouseX >= width *3/4 -250) {
        exit();
      }
    } 
  }
  if(loadoutMenu) {
    if(mouseY <= height/2+100 && mouseY >= height/2-100) {
      if(mouseX <= width/4 + 250 && mouseX >= width/4 - 250) {
        player = new Player(0);
        loadoutMenu = false;
      }
      if(mouseX <= width*3/4 + 250 && mouseX >= width*3/4 - 250) {
        player = new Player(1);
        loadoutMenu = false;
      }
    }
  }
  if(!startMenu || !restartMenu || !loadoutMenu){
    if (mouseButton == LEFT){
      player.weapon.fire(player.x, player.y, true);
    }
    if (mouseButton == RIGHT){
      player.secondary.fire(player.x, player.y, true);
    }
  }
}
