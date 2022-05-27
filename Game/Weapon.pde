public class Weapon {
  private Projectile[] ammo;
  public Projectile active;
  public Weapon() {
    active = new Projectile();
    ammo = new Projectile[3];
    ammo[0] = active;
  }
}
