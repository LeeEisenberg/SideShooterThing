public class Weapon {
  private Projectile[] ammo;
  public Projectile active;
  public int pattern;
  public Weapon(int pattern_) {
    active = new Projectile();
    ammo = new Projectile[3];
    ammo[0] = active;
    pattern = pattern_;
  }
  public Weapon(){
    this(1);
  }
  void fire(float x, float y, boolean friendly) {
    if (pattern == 2){
      Projectile bullet1 = new Projectile().copy(active);
      Projectile bullet2 = new Projectile().copy(active);
      bullet1.setxPos(x);
      bullet1.setyPos(y+10);
      bullet2.setxPos(x);
      bullet2.setyPos(y-10);
      if (!friendly){
        bullet1.dX *= -1;
        bullet1.friendly = false;
        bullet2.dX *= -1;
        bullet2.friendly = false;
      }
      projectiles.add(bullet1);
      projectiles.add(bullet2);
    } else if (pattern == 1){
      Projectile bullet = new Projectile().copy(active);
      bullet.setxPos(x);
      bullet.setyPos(y);
      if (!friendly){
        bullet.dX *= -1;
        bullet.friendly = false;
      }
      projectiles.add(bullet);
    }
  }
}
