public class SpaceShip {
   private float x, y;
   public float HP;
   private float size;
   private Weapon weapon;
   private ArrayList<Powerup> drops = new ArrayList<Powerup>();
   public SpaceShip() {
     x = 0;
     y = 0;
     size = 100;
     HP = 100;
   }
   void move(float x_, float y_) {
     x = x_+x;
     y = y_+y;
   }
   void render() {
     circle(x, y, size);
     isHit();
   }
   void isHit() {
     for(int i = 0; i < bullets.size(); i++) {
       Projectile b = bullets.get(i);
       if(dist(x, y, b.xPos, b.yPos) <= size/2 && !b.friendly) {
         HP -= b.damage;
         bullets.remove(b);
       }
     }
   }
}
