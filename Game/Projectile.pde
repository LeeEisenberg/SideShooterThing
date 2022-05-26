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
  public Projectile(int size, float x, float y, float dX, float dY, int damage) {
    this.size = size;
    xPos = x;
    yPos = y;
  }
  
  public void move(){
    xPos += dX;
    yPos += dY;
  }
  public void render(){
    fill(hue);
    circle(xPos, yPos, size);
  }
}
