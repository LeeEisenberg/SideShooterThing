public class SpecialWeapon {
  private float charge;
  private Weapon rocketeer;
  private float specialTimer;
  PImage[] cannonSprites;
  PImage[] cBases;
  private int frame;
  private int pattern;
  public boolean active;
  public SpecialWeapon(int pattern_) {
    charge = 0;
    specialTimer = 0;
    cannonSprites = new PImage[4];
    cBases = new PImage[4];    
    for(int i = 0; i <= 3; i++) {
      cannonSprites[i] = loadImage("sprites/cannon"+(i+1)+".png");
      cBases[i] = loadImage("sprites/cBase"+(i+1)+".png");
    }
    pattern = pattern_;
    rocketeer = new Weapon(6);
  }
  void fire(float x, float y) {
    frame = (frame+1) % 4;
    if(specialTimer > 0) {
      if(pattern == 0){
        for(int i = 0; i <= 16; i++) {
          image(cannonSprites[frame], x+(115)+85*(i+1), y);
        }
        image(cBases[frame], x+100, y);
        if(!wave.bossTime){
          for(int i = 0; i < wave.fleet.size(); i++) {
            if(wave.fleet.get(i).y >= y-100 && wave.fleet.get(i).y <= y+100 && wave.fleet.get(i).x >= x) {
              wave.fleet.get(i).HP -= 7;
            }
          }
        }
        if(wave.bossTime) {
          if(wave.boss.ver == 0) {
            wave.boss.HP -= 5;
          }
          if(wave.boss.ver == 1) {
            if(wave.boss.y >= y-100 && wave.boss.y <= y+100) {
              wave.boss.HP -= 5;
            }
          }
        }
      }
      if(pattern == 1) {
        Projectile rocket = new Projectile();
        rocket.homing = true;
        rocket.setxPos(x);
        rocket.setyPos(y);
        rocket.damage = 20;
        projectiles.add(rocket);
      }
      specialTimer--;
    }else {
      active = false;
    }
  }
  void activate(float x, float y) {
    if(specialTimer == 0 && charge >= 100) {
      superSound.play();
      Game.player.power1Time += 120; //invincibility frames lol
      specialTimer = 120;
      charge = 0;
      specialAnim = true;
      active = true;
    }
  }
}
