import java.util.ArrayList;
import processing.sound.*;

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
PImage[] rockets;
PImage[] explosions;
PImage mothership;
PImage secondboss;
SoundFile superSound;
SoundFile pew;
SoundFile pierce;
SoundFile explode;
SoundFile missile;
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
  mothership = loadImage("sprites/mother.png");
  
  sprites = new PImage[4];
  for(int i = 0; i < 4; i++) {
      sprites[i] = loadImage("sprites/proj"+(i+1)+".png");
  }
  secondboss = loadImage("sprites/type2.png");
  secondboss.resize(secondboss.width*5, secondboss.height*5);
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
  lightning = new PImage[10];
  for(int i = 0; i < 10; i++) {
    lightning[i] = loadImage("sprites/light"+(i+1)+".png");
    lightning[i].resize(lightning[i].width*5, lightning[i].height*5);
  }
  background = loadImage("sprites/background.jpg");
  background.resize(width,height);
  specialAnim = false;
  pew = new SoundFile(this, "sounds/lasershot.wav");
  pew.amp(.3);
  pierce = new SoundFile(this, "sounds/pierceshot.wav");
  pierce.amp(.2);
  explode = new SoundFile(this, "sounds/explode.wav");
  explode.amp(.2);
  missile = new SoundFile(this, "sounds/missile.wav");
}
void draw(){
    if(!startMenu && !restartMenu && !loadoutMenu){
      tint(255,255);
      rectMode(CORNER);
      textAlign(LEFT);
      image(background, 750, 500);
      textSize(100);
      fill(255);
      text("Wave: " + (level+1), 20, 100);
      fill(128);
      rect(700, 0, 500, 50);
      rect(700, 50, 500, 50);
      fill(0, 0, 255);
      rect(700, 50, 5*player.cannon.charge, 50);
      fill(255-player.HP, 255-2*(100-player.HP), 0);
      rect(700, 0, player.HP*5, 50);
      textSize(50);
      fill(0, 255, 0);
      text("HP:", 500, 50);
      fill(0, 0, 255);
      text("METER:", 500, 100);
      
      if (wave.fleet.size() < 1 || wave.bossTime && wave.boss.HP <= 0){//creates new wave if previous wave is ded
        level++;
        wave = new EnemyWave();
      }
      if(wave.bossTime){wave.boss.render();}
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
      if(!wave.bossTime) {
        for (int x = 0; x < wave.fleet.size(); x++){
          wave.fleet.get(x).render();
        }
      }
      for (int i = 0; i < projectiles.size(); i++){
        Projectile p = projectiles.get(i);
        p.render();
        if(p.xPos >= width || p.yPos >= height || p.xPos <= 0 || p.yPos <= 0 ||(p.homing && !p.friendly && p.hcounter > 240)) {
          projectiles.remove(i);
        }
      }
      for (int x = 0; x < wave.fleet.size(); x++){
        if (wave.fleet.get(x).x < 0){
          restartMenu = true;
        }
      }
      if (player.HP < 1){
        restartMenu = true;
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
  if(restartMenu) {
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 1100, 600);
    textSize(100);
    textAlign(CENTER);
    fill(0);
    text("You Lost...", width/2, height*5/12);
    rect(width/4, height*7/12, 300, 100);
    rect(width*3/4, height*7/12, 300, 100);
    textSize(50);
    fill(255);
    text("Restart", width/4, height*7/12+17);
    text("Exit", width*3/4, height*7/12+17);
  }
  if (!startMenu && !restartMenu && !loadoutMenu){
    fill(255);
    text("Highest Level: "+hiScore, 10, 980);
  }
}
 
void keyPressed() {
  player.setDir(key, true);
  if (key == CODED && keyCode == SHIFT) {
    player.dash();
  }
  if (key == ' ' && !player.cannon.active) {
    player.weapon.fire(player.x, player.y, true);
  }
  if (key == 'e') {
    player.cannon.activate((int)player.x, (int)player.y);
  }
  if (key == 'f') {
    player.secondary.fire(player.x, player.y, true);
  }
  if (key == '1') {
    player.HP = 100;
  }
  if (key == '2') {
    player.HP = 0;
  }
  if (key == '3') {
    player.cannon.charge = 100;
  }
  if (key == '4'){
    level++;
    wave = new EnemyWave();
  }
  if (key == '5'){
    player.power1Time = Integer.MAX_VALUE;
  }
  if (key == '6'){
    player.power3Time = Integer.MAX_VALUE;
  }
  if (key == '7'){
    player.power1Time = 0;
    player.power3Time = 0;
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
        superSound = new SoundFile(this, "sounds/protoncannon.wav");
      }
      if(mouseX <= width*3/4 + 250 && mouseX >= width*3/4 - 250) {
        player = new Player(1);
        loadoutMenu = false;
        superSound = new SoundFile(this, "sounds/heresmysundaybest.wav");
      }
    }
  }
  if(restartMenu) {
    if(mouseY <= height*7/12+50 && mouseY >= height*7/12-50) {
      if(mouseX <= width/4 +150 && mouseX >= width/4 - 150) {
        hiScore = level;
        wave = new EnemyWave();
        projectiles = new ArrayList<Projectile>();
        level = 0;
        player.HP = 100;
        player.cannon.charge = 0;
        player.x = 0;
        player.y = height/2;
        restartMenu = false;
        wave.bossTime = false;
      }
      if(mouseX <= width*3/4 + 150 && mouseX >= width*3/4 -150) {
        exit();
      }
    }
  }
  if(!startMenu && !restartMenu && !loadoutMenu){
    if (mouseButton == LEFT){
      player.weapon.fire(player.x, player.y, true);
      pew.play();
    }
    if (mouseButton == RIGHT){
      player.secondary.fire(player.x, player.y, true);
    }
  }
}
