public class Player extends SpaceShip {
  private float basedX;
  private float basedY;
  private float dX;
  private float dY;
  public Player() {
    super();
    dX = 0;
    dY = 0;
    basedX = dX;
    basedY = dY;
  }
  void moveUp(boolean up) {
    if(up) {
      dY = -basedY;
    }
  }
  void moveDown(boolean down) {
    if(down) {
      dY = basedY;
    }
  }
  void moveRight(boolean right) {
    if(right) {
      dX = basedX;
    }  
  }
  
  void moveLeft(boolean left) {
    if(left) {
      dX = -basedX;
    }
  }
  void move() {
    move(dX, dY);
  }
}
