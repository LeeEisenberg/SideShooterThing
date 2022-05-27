public class Weapon {
  private Projectile[] ammo;
  public Projectile active;
  public Weapon() {
    active = new Projectile();
    ammo = new Projectile[3];
    ammo[0] = active;
  }
  void fire(float x, float y) {
    Projectile bullet = new Projectile().copy(active);
    bullet.setxPos(x);
    bullet.setyPos(y);
    projectiles.add(bullet);
  }
}
