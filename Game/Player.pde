public class Player extends SpaceShip {
  private float basedX;
  private float basedY;
  private float dX;
  private float dY;
  public Player() {
    super();
    dX = 0;
    dY = 0;
    basedX = 6.66;
    basedY = 6.66;
  }
 
  void move() {
    move(dX, dY);
  }
  void display() {
    super.display();
    move();
  }
  void move(boolean up, boolean down, boolean left, boolean right) {
    if(up) {
      dY = -basedY;
    }
    if(down) {
      dY = basedY;
    }
    if(right) {
      dX = basedX;
    }
    if(left) {
      dX = -basedX;
    }
    if(!up && !down) {
      dY = 0;
    }
    if(!left && !right) {
      dX = 0;
    }
  }
}
