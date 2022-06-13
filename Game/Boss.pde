public class Boss {
  public int ver;
  public int mode;
  boolean ready;
  int fcounter;
  boolean descent;
  boolean ascent;
  int HP, mHP;
  int x, y;
  public Boss(int v, int HP_) {
    ver = v;
    HP = HP_;
    mHP = HP;
    mode = 0;
    x = width+300;
    ascent = true;
    y = height/2;
  }
  void isHit() {
    for(int i = 0; i < projectiles.size(); i++) {
      if(ver == 0 && ready && projectiles.get(i).xPos >= width-254 && projectiles.get(i).friendly) {
        HP -= projectiles.remove(i).damage;
      }
      if(ver == 1 && ready) {
        if(projectiles.get(i).friendly && dist(x, y, projectiles.get(i).xPos, projectiles.get(i).yPos) <= 200){
          HP -= projectiles.remove(i).damage;
        }
      }
    }
  }
  void fire() {
    if(ver == 0){
      if(x >= width) {
        x-=5;
      }else{
        ready = true;
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
          bullet.dX = ( -10 -(level-6)) * (delX / sqrt((delX*delX)+(delY*delY)));
          bullet.dY =( -10 -(level-6))* (delY / sqrt((delX*delX)+(delY*delY)));
          projectiles.add(bullet);
          Projectile bullet2 = new Projectile();
          bullet2.xPos = width-254;
          bullet2.yPos = height/2-50;
          delX = bullet.xPos - player.x;
          delY = bullet.yPos - player.y;
          bullet2.dX = (-10 -(level-6))* (delX / sqrt((delX*delX)+(delY*delY)));
          bullet2.dY = (-10-(level-6)) * (delY / sqrt((delX*delX)+(delY*delY)));
          bullet2.friendly = false;
          projectiles.add(bullet2);
        }
        if (fcounter >= 100) {
          fcounter = 0;
          mode = (mode+1)%2;
        }
      }
    }
    if(ver == 1) {
      if(x >= width-secondboss.width) {
        x-=10;
      }else {
        ready = true;
        fcounter++;
        println(ascent);
        println(descent);
        println(y);
        if(ascent == true && y > height/2-200) {
          y-=5;
        }
        if(ascent == true && y <= height/2-200) {
          descent = true;
          ascent = false;
        }
        if(descent == true && y < height/2+200) {
          y += 5;
        }
        if(descent == true && y >= height/2+200) {
          descent = false;
          ascent = true;
        }
        if(fcounter % 20 == 0) {
          Projectile e = new Projectile();
          e.homing = true;
          e.friendly = false;
          e.target = player;
          e.xPos = x;
          e.yPos = y;
          projectiles.add(e);
        }
        if(fcounter >= 200) {
          fcounter = 0;
        }
      }  
    }
  }
  void render() {
    if(ver == 0) {
      image(mothership, x, y);
    }
    if(ver == 1) {
      image(secondboss, x, y);
    }
    isHit();
    if(!specialAnim){fire();}
  }
}
