public class Powerup extends Projectile{
  private int effectType;
  
  public Powerup(int effectType_){
    super();
    friendly = false;
    damage = 0;
    if (effectType_ == 1){
      setHue(150, 150, 255);
    }
    if (effectType_ == 2){
      setHue(150, 255, 150);
    }
  }
}
