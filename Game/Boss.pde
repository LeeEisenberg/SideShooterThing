public class Boss {
  public int ver;
  public int mode;
  int fcounter;
  int HP;
  public Boss(int v, int HP_) {
    ver = v;
    HP = HP_;
    mode = 0;
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
      if(mode == 0){
      rect(0, height/2-100, width-254, 200);}
      if(mode == 1) {
        rect(0, 0, width-254, 200);
        rect(0, height-200, width-254, 200);
      }
      stroke(0);
    }
    if(fcounter >= 90 && fcounter < 100) {
      if(mode == 0){
        image(lightning[(fcounter)%10], width/2-254, height/2);
        if(player.y <= height/2 + 100 && player.y >= height/2 - 100) {
          player.HP = 0;
        }
      }
      if(mode == 1) {
        image(lightning[fcounter%10], 0, 100);
        image(lightning[fcounter%10], 0, height-100);
        if(player.y <= 100 && player.y >= 0 || player.y <= height && player.y >= height-100) {
          player.HP = 0;
       }
      }
    }
    if(fcounter % 20 == 0) {
      Projectile bullet = new Projectile();
      bullet.friendly = false;
      bullet.xPos = width-254;
      bullet.yPos = height/2+50;
      float delX = bullet.xPos - player.x;
      float delY = bullet.yPos - player.y;
      bullet.dX = 10 * (delX / sqrt((delX*delX)+(delY*delY)));
      bullet.dY = 10 * (delY / sqrt((delX*delX)+(delY*delY)));
      projectiles.add(bullet);
      Projectile bullet2 = new Projectile();
      bullet2.xPos = width-254;
      bullet2.yPos = height/2-50;
      delX = bullet.xPos - player.x;
      delY = bullet.yPos - player.y;
      bullet2.dX = -6 * (delX / sqrt((delX*delX)+(delY*delY)));
      bullet2.dY = -6 * (delY / sqrt((delX*delX)+(delY*delY)));
      bullet2.friendly = false;
      projectiles.add(bullet2);
    }
    if (fcounter >= 100) {
      fcounter = 0;
      mode = (int)(random(2));
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
