public class Player extends SpaceShip {
  private float basedX, basedY, dY, dX, dashTimer;
  public boolean up, down, left, right;
  public PImage sprite;
  private SpecialWeapon cannon;
  private Weapon secondary;
  public int power1Time;
  public int power3Time;
  
  public Player(int loadout) {
    super(2);
    dX = 0;
    dY = 0;
    basedX = 6.66;
    basedY = 6.66;
    up = false;
    down = false;
    left = false;
    right = false;
    sprite = loadImage("sprites/player.png");
    if(loadout == 0) {
      secondary = new Weapon(5);
    }
    if(loadout == 1) {
      secondary = new Weapon(6);
    }
    cannon = new SpecialWeapon(loadout);
  }
 
  void move() {
    move(dX, dY);
  }
  void render() {
    imageMode(CENTER);
    if(power1Time > 0) {
      tint(100, 100, 255);
    }
    image(sprite, x, y);
    tint(255);
    isHit();
    move(up, down, left, right);
    move();
    if(dashTimer > 0){
      dashTimer--;
    }
    if(power1Time > 0) {
      power1Time--;
    }
    if(power3Time > 0) {
      power3Time--;
    }
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
      case ' ':
        weapon.fire(x, y, true);
        break;
      case 'e':
        cannon.activate((int)x, (int)y);
        break;
      case 'f':
        secondary.fire(x, y, true);
        break;
      case 'l':
        if (bool){
          level++;
          wave = new EnemyWave(level);
          break;
        }
     }
  }
  void isHit() {
     for(int i = projectiles.size()-1; i >= 0; i--) {
       Projectile b = projectiles.get(i);
       if(dist(x, y, b.xPos, b.yPos) <= size/2 && !b.friendly) {
         if(power1Time <= 0 || b.damage < .1){
           b.apply();
         }
         projectiles.remove(i);
       }
     }
   }
   void dash() {
    if(dashTimer == 0) {
      power1Time += 5;
      if(power3Time <= 0) {
        dashTimer = 100;
        move(dX*20, dY*20);
      }else {
        move(dX*40, dY*40);
      }
    }
  }
}
