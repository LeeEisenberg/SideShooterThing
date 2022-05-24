public class SpaceShip {
   float[] coords;
   public SpaceShip() {
     coords = new float[]{0, 0};
   }
   void move(float x, float y) {
     coords[0] = coords[0]+x;
     coords[1] = coords[1]+y;
   }
   void display() {
     rectMode(CENTER);
     square(coords[0], coords[1], 100);
   }
}
