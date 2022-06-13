public class Projectile{
  private float size;
  protected float xPos;
  protected float yPos;
  public float dX;
  private float dY;
  public double damage;
  private int type;
  protected color hue;
  public boolean friendly;
  public int frame;
  public boolean pierce;
  public boolean homing;
  public boolean homed;
  public int hcounter;
  public SpaceShip target;
  
  
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
  
  public Projectile(int red, int green, int blue){
    size = 10;
    xPos = 200;
    yPos = 200;
    dX = 10;
    dY = 0;
    damage = 10;
    type = 0;
    hue = color(red, green, blue);
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
  public Projectile(float size_, float xPos_, float yPos_, float dX_, float dY_, double damage_, color hue_, boolean friendly_, boolean pierce_){
    this(size_, xPos_, yPos_, dX_, dY_, damage_, hue_, friendly_);
    pierce = pierce_;
  }
  public Projectile(float size_, float xPos_, float yPos_, float dX_, float dY_, double damage_, color hue_, boolean friendly_, boolean homing_, boolean pierce_){
    this(size_, xPos_, yPos_, dX_, dY_, damage_, hue_, friendly_);
    homing = homing_;
    pierce = pierce_;
  }
  public void home() {
    if(wave.fleet.size() != 0 && friendly) {
      if(!homed || wave.fleet.indexOf(target) == -1) {
        target = wave.fleet.get((int)random(wave.fleet.size()));
        homed = true;
      }
      SpaceShip e = target;
      float delX = e.x - xPos;
      float delY = e.y - yPos;
      dX = 10 * (delX / sqrt((delX*delX)+(delY*delY)));
      dY = 10 * (delY / sqrt((delX*delX)+(delY*delY)));
    }
    if(!friendly) {
      SpaceShip e = player;
      hcounter++;
      float delX = e.x - xPos;
      float delY = e.y - yPos;
      dX = 10 * (delX / sqrt((delX*delX)+(delY*delY)));
      dY = 10 * (delY / sqrt((delX*delX)+(delY*delY)));
    }
  }
  public void move(){
    if(homing){home();}
    xPos += dX;
    yPos += dY;
  }
  public void render(){
    tint(hue);
    frame = (frame+1) % 4;
    if(!friendly) {
      if(homing) {
        pushMatrix();
        translate(xPos, yPos);
        if(target.x < xPos) {
          rotate(PI+atan(dY/dX));
        }else {
          rotate(atan(dY/dX));
        }
        image(rockets[frame], 0, 0);
        popMatrix();
      }else{
        pushMatrix();
        scale( -1, 1 );
        image(sprites[frame], -xPos, yPos);
        popMatrix();
      }
    }else {
      if(pierce){
        pushMatrix();
        translate(xPos, yPos);
        scale(2);
        image(piercing[0], 0, 0);
        popMatrix();
      }if(homing){
        pushMatrix();
        translate(xPos, yPos);
        if(target != null && target.x < xPos) {
          rotate(PI+atan(dY/dX));
        }else {
          rotate(atan(dY/dX));
        }
        image(rockets[frame], 0, 0);
        popMatrix();
      }else{
         image(sprites[frame], xPos, yPos);
      }
    }
    tint(255);
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
  void setHue(int r, int g, int b){
    hue = color(r, g, b);
  }
  Projectile copy(Projectile p) {
    return new Projectile(p.size, p.xPos, p.yPos, p.dX, p.dY, p.damage, p.hue, p.friendly, p.pierce);
  }
  void apply(){
    Game.player.HP -= damage;
  }
}
