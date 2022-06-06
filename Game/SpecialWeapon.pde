public class SpecialWeapon {
  private float charge;
  private Projectile bullet;
  private float specialTimer;
  PImage[] cannonSprites;
  PImage[] cBases;
  private int frame;
  public SpecialWeapon() {
    charge = 100;
    bullet = new Projectile();
    specialTimer = 0;
    cannonSprites = new PImage[4];
    cBases = new PImage[4];    
    for(int i = 0; i <= 3; i++) {
      cannonSprites[i] = loadImage("sprites/cannon"+(i+1)+".png");
      cBases[i] = loadImage("sprites/cBase"+(i+1)+".png");
    }
  }
  void fire(float x, float y) {
    frame = (frame+1) % 4;
    if(specialTimer > 0) {
      for(int i = 0; i <= 16; i++) {
        image(cannonSprites[frame], x+(115)+85*(i+1), y);
      }
      image(cBases[frame], x+100, y);
      for(int i = 0; i < wave.fleet.size(); i++) {
        if(wave.fleet.get(i).y >= y-100 && wave.fleet.get(i).y <= y+100) {
          wave.fleet.get(i).HP -= 5;
        }
      }
      specialTimer--;
    }
  }
  void activate(float x, float y) {
    if(specialTimer == 0) {
      specialTimer = 60;
    }
  }
}
