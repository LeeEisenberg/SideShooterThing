public class Player extends SpaceShip {
  private float basedX, basedY, dY, dX;
  public boolean up, down, left, right;
  public Player() {
    super(0, 500, 100, 100);
    dX = 0;
    dY = 0;
    basedX = 6.66;
    basedY = 6.66;
    up = false;
    down = false;
    left = false;
    right = false;
  }
 
  void move() {
    move(dX, dY);
  }
  void render() {
    super.render();
    move(up, down, left, right);
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
  void setDir(int k, boolean bool) {
    switch (k) {
      case 'w':
        up = bool;
        break;
      case 'a':
        left = bool;
        break;
      case 's':
        down = bool;
        break;
      case 'd':
        right = bool;
        break;
     }
  }
  void isHit() {
     for(int i = 0; i < projectiles.size(); i++) {
       Projectile b = projectiles.get(i);
       if(dist(x, y, b.xPos, b.yPos) <= size/2 && !b.friendly) {
         HP -= b.damage;
         projectiles.remove(b);
       }
     }
   }
}
