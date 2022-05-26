public class Projectile{
  private float size;
  private float xPos;
  private float yPos;
  private float dX;
  private float dY;
  private double damage;
  private int type;
  private color hue;
  private boolean friendly;
  
  public Projectile(){
    size = 10;
    xPos = 200;
    yPos = 200;
    dX = 1;
    dY = 5;
    damage = 10;
    type = 0;
    hue = color(255);
    friendly = true;
  }
  public Projectile(float size_, float xPos_, float yPos_, float dX_, float dY_, double damage_, color hue_, boolean friendly_){
    size = size_;
    xPos = xPos_;
    yPos = yPos_;
    dX = dX_;
    dY = dY_;
    damage = damage_;
    hue = hue_;
    friendly = friendly_;
  }
  
  public void move(){
    xPos += dX;
    yPos += dY;
  }
  public void render(){
    fill(hue);
    circle(xPos, yPos, size);
  }
  //public void hitDetec(){//deprecated
  //  for (SpaceShip s : Game.wave.fleet){
  //    if (dist(s.xPos, s.yPos, xPos, yPos) < (size+s.size)/2){//make sure the size variables match this usage
  //      size = 0; //make sure to detect size 0 for deletion in Game class
  //      s.HP -= damage;
  //    }
  //  }
  //}
}
