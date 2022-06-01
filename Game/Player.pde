public class Player extends SpaceShip {
  private float basedX, basedY, dY, dX, dashTimer;
  public boolean up, down, left, right;
  public PImage sprite;
  public Player() {
    super();
    dX = 0;
    dY = 0;
    basedX = 6.66;
    basedY = 6.66;
    up = false;
    down = false;
    left = false;
    right = false;
    sprite = loadImage("sprites/player.png");
  }
 
  void move() {
    move(dX, dY);
  }
  void render() {
    imageMode(CENTER);
    image(sprite, x, y);
    isHit();
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
    if(dashTimer != 0) {
      dX *= 5;
      dY  *=5;
      dashTimer--;
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
      case ' ':
        fire(true);
        break;
     }
  }
  void isHit() {
     for(int i = projectiles.size()-1; i >= 0; i--) {
       Projectile b = projectiles.get(i);
       if(dist(x, y, b.xPos, b.yPos) <= size/2 && !b.friendly) {
         HP -= b.damage;
         projectiles.remove(i);
       }
     }
   }
  void dash() {
    if(dashTimer == 0) {
      dashTimer = 60;
    }
  }
}
