public class Boss {
  public int ver;
  int fcounter;
  int HP;
  public Boss(int v, int HP_) {
    ver = v;
    HP = HP_;
  }
  void isHit() {
    for(int i = 0; i < projectiles.size(); i++) {
      if(projectiles.get(i).xPos >= width-254 && projectiles.get(i).friendly) {
        HP -= projectiles.remove(i).damage;
      }
    }
  }
  void fire() {
    fcounter++;
    if(fcounter < 90) {
      rectMode(CORNER);
      fill(3, 236, 252, fcounter*(255/90));
      noStroke();
      rect(0, height/2-100, width-24, 200);
      stroke(0);
    }
    if(fcounter >= 90 && fcounter < 100) {
      image(lightning[(fcounter)%10], width/2-254, height/2);
      if(player.y <= height/2 + 100 && player.y >= height/2 - 100) {
        player.HP = 0;
      }
    }
    if (fcounter >= 100) {
      
    }
  }
  void render() {
    if(ver == 0) {
      image(mothership, width, height/2);
      isHit();
      fire();
    }
  }
}
