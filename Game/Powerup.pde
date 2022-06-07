public class Powerup extends Projectile{
  private int effectType;
  
  public Powerup(int effectType_){
    super();
    friendly = false;
    damage = 0;
    if (effectType_ == 1){
      setHue(150, 150, 255);//should be blue
      effectType = 1;
    } else if (effectType_ == 2){
      setHue(150, 255, 150);//should be green
      effectType = 2;
    } else if (effectType_ == 3){
      setHue(200, 150, 255);//should be purple
      effectType = 3;
    } else {
      setxPos(-10);
    }
  }
  
  public void apply(){
    if (effectType == 1){
      //invincibility or smth
    }
    if (effectType == 2){
      //healing
      Game.player.HP += 10;
    }
    if (effectType == 3){
      //damage buff or smth
    }
  }
}
