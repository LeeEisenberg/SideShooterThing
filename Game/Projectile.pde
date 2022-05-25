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
    dX = 10;
    dY = 50;
    damage = 10;
    type = 0;
    hue = new color(255);
    friendly = true;
  }
  
  public void move(){
    xPos += dX;
    yPos += dY;
  }
}
