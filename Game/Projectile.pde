public class Projectile{
  private float size;
  private float xPos;
  private float yPos;
  public float dX;
  private float dY;
  private double damage;
  private int type;
  private color hue;
  public boolean friendly;
  public int frame;
  
  public Projectile(){
    size = 10;
    xPos = 200;
    yPos = 200;
    dX = 10;
    dY = 0;
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
    frame = (frame+1) % 4;
    if(!friendly) {
      pushMatrix();
      scale( -1, 1 );
      image(sprites[frame], -xPos, yPos);
      popMatrix();
    }else {
      image(sprites[frame], xPos, yPos);
    }
    
  }
  //public void hitDetec(){//deprecated
  //  for (SpaceShip s : Game.wave.fleet){
  //    if (dist(s.xPos, s.yPos, xPos, yPos) < (size+s.size)/2){//make sure the size variables match this usage
  //      size = 0; //make sure to detect size 0 for deletion in Game class
  //      s.HP -= damage;
  //    }
  //  }
  //}
  void setxPos(float x) {
    xPos = x;
  }
  void setyPos(float y) {
    yPos = y;
  }
  Projectile copy(Projectile p) {
    return new Projectile(p.size, p.xPos, p.yPos, p.dX, p.dY, p.damage, p.hue, p.friendly);
  }
}
