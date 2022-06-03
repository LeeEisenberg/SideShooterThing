public class SpecialWeapon {
  private float charge;
  private Projectile bullet;
  private float specialTimer;
  public SpecialWeapon() {
    charge = 100;
    bullet = new Projectile();
    specialTimer = 0;
  }
  void fire(float x, float y) {
    if(specialTimer == 0) {
      specialTimer = 60;
    }
    while(specialTimer > 0) {
      for(int i = 0; i < wave.fleet.size(); i++) {
        if(wave.fleet.get(i).y >= y-100 && wave.fleet.get(i).y <= y+100) {
          wave.fleet.get(i).HP -= 50;
        }
      }
      specialTimer--;
    }
  }
}
