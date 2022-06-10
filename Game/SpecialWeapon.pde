public class SpecialWeapon {
  private float charge;
  private Weapon rocketeer;
  private float specialTimer;
  PImage[] cannonSprites;
  PImage[] cBases;
  private int frame;
  private int pattern;
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
        for(int i = 0; i < wave.fleet.size(); i++) {
          if(wave.fleet.get(i).y >= y-100 && wave.fleet.get(i).y <= y+100) {
            wave.fleet.get(i).HP -= 5;
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
    }
  }
  void yell() {
     if(pattern == 0) {
       cannonyell.play();
     }
     if(pattern == 1) {
       sundaybest.play();
     }
   }
  void activate(float x, float y) {
    if(specialTimer == 0 && charge >= 100) {
      Game.player.power1Time += 120; //invincibility frames lol
      specialTimer = 120;
      charge = 0;
      specialAnim = true;
      yell();
    }
  }
}
