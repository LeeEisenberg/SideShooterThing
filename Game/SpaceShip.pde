public class SpaceShip {
   protected float x, y;
   public float HP;
   protected float size;
   protected Weapon weapon;
   protected ArrayList<Powerup> drops = new ArrayList<Powerup>();
   protected PImage sprite;
   public SpaceShip() {
     x = 0;
     y = 500;
     size = 100;
     HP = 100;
     weapon = new Weapon();
     sprite = loadImage("sprites/ship.png");
   }
   public SpaceShip(float x_, float y_, float size_, float HP_){
     x = x_;
     y = y_;
     size = size_;
     HP = HP_;
     weapon = new Weapon();
     sprite = loadImage("sprites/ship.png");
   }
   void move(float x_, float y_) {
     x = x_+x;
     y = y_+y;
   }
   void render() {
     image(sprite, x, y);
     isHit();
   }
   void isHit() {
     for(int i = projectiles.size()-1; i >= 0; i--) {
       Projectile b = projectiles.get(i);
       if(dist(x, y, b.xPos, b.yPos) <= size/2 && b.friendly) {
         HP -= b.damage;
         projectiles.remove(i);
       }
     }
   }
   void fire(boolean friendly_) {
     weapon.fire(x, y, friendly_);
   }
}
