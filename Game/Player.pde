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
  void moveUp(boolean up) {
    if(up) {
      dY = -basedY;
    }else {
      dY = 0;
    }
  }
  void moveDown(boolean down) {
    if(down) {
      dY = basedY;
    }else {
      dY = 0;
    }
  }
  void moveRight(boolean right) {
    if(right) {
      dX = basedX;
    }else {
      dX = 0;
    }  
  }
  
  void moveLeft(boolean left) {
    if(left) {
      dX = -basedX;
    }else {
      dX = 0;
    }
  }
  void move() {
    move(dX, dY);
  }
  void move(boolean up, boolean down, boolean left, boolean right) {
    moveUp(up);
    moveDown(down);
    moveLeft(left);
    moveRight(right);
  }
}
