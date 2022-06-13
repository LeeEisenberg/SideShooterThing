public class SpaceShip {
   protected float x, y;
   public float HP, mHP;
   protected float size;
   protected Weapon weapon;
   protected ArrayList<Projectile> drops = new ArrayList<Projectile>();
   protected PImage sprite;
   private double multiplier;
   public int exFrame;
   public boolean exploding;
   public SpaceShip() {
     x = 0;
     y = 500;
     size = 100;
     HP = 100;
     mHP = HP;
     weapon = new Weapon();
     sprite = loadImage("sprites/ship.png");
   }
   public SpaceShip(int pattern, double mult){
     this();
     weapon = new Weapon(pattern);
     multiplier = mult;
   }
   public SpaceShip(float x_, float y_, float size_, float HP_){
     exploding = false;
     x = x_;
     y = y_;
     size = size_;
     HP = HP_;
     mHP = HP;
     weapon = new Weapon();
     sprite = loadImage("sprites/ship.png");
     drops.add(new Powerup((int) random(1, 7)));
     for (int i = drops.size()-1; i > 0; i--){
       if (drops.get(i).dX > 100){
         drops.remove(i);
       }
     }
   }
   public SpaceShip(float x_, float y_, float size_, float HP_, int pattern, double mult){
     this(x_, y_, size_, HP_);
     weapon = new Weapon(pattern);
     multiplier = mult;
   }
   void move(float x_, float y_) {
     x += x_;
     y += y_*multiplier;
   }
   
   void render() {
     sprite.resize((int)(224 * size/150), (int)(148 * size/150));
     image(sprite, x, y);
     isHit();
     fill(255-255*HP/mHP, 255-200*(1-HP/mHP), 0);
     rectMode(CENTER);
     rect(x, y+size/2+50, 100*HP/mHP, 20);
   }
   void isHit() {
     for(int i = projectiles.size()-1; i >= 0; i--) {
       Projectile b = projectiles.get(i);
       if(dist(x, y, b.xPos, b.yPos) <= size/2 && b.friendly) {
         HP -= b.damage;
         if(!projectiles.get(i).pierce){
           projectiles.remove(i);
         }
       }
     }
   }
   void explode(){
     for (int i = 0; i < drops.size(); i++){
       drops.get(i).dX *= -1;
       drops.get(i).friendly = false;
       drops.get(i).setxPos(x);
       drops.get(i).setyPos(y);
       projectiles.add(drops.get(i));
     }
   }
   void fire() {
     weapon.fire(x, y, false);
   }
}
