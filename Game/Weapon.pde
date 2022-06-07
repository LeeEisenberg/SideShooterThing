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
    if (pattern == 3){//3 bullets at a spread
      Projectile bullet1 = new Projectile(255, 75, 0);
      Projectile bullet2 = new Projectile(255, 75, 0);
      Projectile bullet3 = new Projectile(255, 75, 0);
      bullet1.setxPos(x);
      bullet1.setyPos(y+30);
      bullet2.setxPos(x);
      bullet2.setyPos(y-30);
      bullet3.setxPos(x);
      bullet3.setyPos(y);
      bullet1.dY = 5;
      bullet2.dY = -5;
      if (!friendly){
        bullet1.dX *= -1;
        bullet1.friendly = false;
        bullet2.dX *= -1;
        bullet2.friendly = false;
        bullet3.dX *= -1;
        bullet3.friendly = false;
      }
      projectiles.add(bullet1);
      projectiles.add(bullet2);
      projectiles.add(bullet3);
    }
    if (pattern == 2 || pattern == 4){//2 bullets next to each other
    //maybe scale this to ship size??
      Projectile bullet1 = new Projectile(255, 200, 0);
      Projectile bullet2 = new Projectile(255, 200, 0);
      if (pattern == 4){
        bullet1.damage = 15;
        bullet2.damage = 15;
      }
      bullet1.setxPos(x);
      bullet1.setyPos(y+30);
      bullet2.setxPos(x);
      bullet2.setyPos(y-30);
      if (!friendly){
        bullet1.dX *= -1;
        bullet1.friendly = false;
        bullet2.dX *= -1;
        bullet2.friendly = false;
      }
      projectiles.add(bullet1);
      projectiles.add(bullet2);
    } else if (pattern == 1){//1 bullet
      Projectile bullet = new Projectile(255, 200, 0);
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
