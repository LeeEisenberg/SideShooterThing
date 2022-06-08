public class Powerup extends Projectile{
  private int effectType;
  
  public Powerup(int effectType_){
    super();
    friendly = false;
    damage = 0;
    dX = 5;
    if (effectType_ == 1){
      setHue(0, 255, 255);//should be cyan
      effectType = 1;
    } else if (effectType_ == 2){
      setHue(150, 255, 150);//should be green
      effectType = 2;
    } else if (effectType_ == 3){
      setHue(200, 100, 255);//should be purple
      effectType = 3;
    } else {
      dX = 99999;
    }
  }
  
  public void apply(){
    if (effectType == 1){
      if (Game.player.power1Time < 10000){
        Game.player.power1Time = 500;
      }
    }
    if (effectType == 2){
      //healing
      Game.player.HP += 10;
      if (Game.player.HP > 100){
        Game.player.HP = 100;
      }
    }
    if (effectType == 3){
      //damage buff or smth
    }
  }
  
  public void render(){
    tint(hue);
    if(!friendly) {
      pushMatrix();
      scale( -1, 1 );
      image(powerup, -xPos, yPos);
      popMatrix();
    }else {
      image(powerup, xPos, yPos);
    }
    tint(255);
  }
}
