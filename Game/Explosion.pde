public class Explosion {
  int exFrame, size;
  float x, y;
  boolean done;
  public Explosion(float x_, float y_, int size_) {
    x = x_;
    y = y_;
    size = size_;
  }
  void exAnim() {
    if(exFrame < 12) {
      PImage toLoad = explosions[exFrame];
      toLoad.resize(size*toLoad.width, size*toLoad.height);
      image(toLoad, x, y);
      exFrame++;
    }
    if(exFrame > 12) {
      done = true;
    }
  }
}
