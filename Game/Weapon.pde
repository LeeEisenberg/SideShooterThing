public class Weapon {
  private Projectile[] ammo;
  public Projectile active;
  public Weapon() {
    active = new Projectile();
    ammo = new Projectile[3];
    ammo[0] = active;
  }
  void fire(float x, float y, boolean friendly) {
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
