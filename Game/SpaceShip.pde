public class SpaceShip {
   private float[] coords;
   public float HP;
   private Weapon weapon;
   private ArrayList<Powerup> drops = new ArrayList<Powerup>();
   public SpaceShip() {
     coords = new float[]{0, 0};
   }
   void move(float x, float y) {
     coords[0] = coords[0]+x;
     coords[1] = coords[1]+y;
   }
   void render() {
     rectMode(CENTER);
     square(coords[0], coords[1], 100);
   }
   void isHit() {}
}
