import java.util.ArrayList;
import java.util.ArrayDeque;
import java.util.Arrays;
public class EnemyWave {
  public ArrayList<SpaceShip> fleet;
  private ArrayDeque<float[]> flightPlan;
  private Boss boss;
  public boolean bossTime;
  public EnemyWave(){
    //this((int) random(8));
    this(3);
  }
  
  public EnemyWave(int mode) {
    if(level != 0 && level % 5 == 0) {
      boss = new Boss(level%2, 1000+level*100);
      bossTime = true;
    }
    fleet = new ArrayList<SpaceShip>();
    if(mode == 7) {
      fleet.add(new SpaceShip(1400, -500, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1300, -400, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1400, -300, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1500, -400, 75, 50*(1+(level/25.0)), 3, 1));
      fleet.add(new SpaceShip(1400, 1300, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1300, 1400, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1400, 1500, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1500, 1400, 75, 50*(1+(level/25.0)), 3, -1));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-.75, 0, 100, -1});
      for (int i = 0; i < 6; i++){
        flightPlan.add(new float[] {-.75, 2, 0, -1, .01, .02, .03, .04});
        flightPlan.add(new float[] {-.75, 2, 49, -1});
        flightPlan.add(new float[] {-.75, 2, 0, -1, .05, .06, .07, .08});
        flightPlan.add(new float[] {-.75, 2, 49, -1});
      }
      flightPlan.add(new float[] {-.75, 0, 0, 0, .04, .05, .06});
      flightPlan.add(new float[] {-.75, 0, 49, 49});
      flightPlan.add(new float[] {-.75, 0, 0, 0, .01, .02, .03, .07, .08, .09});
      flightPlan.add(new float[] {-.75, 0, 49, 49});
    }
    if(mode == 6) {
      fleet.add(new SpaceShip(1400, -500, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1400, -400, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1400, -300, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1700, 400, 75, 50*(1+(level/25.0)), 2, 0));
      fleet.add(new SpaceShip(1600, 500, 75, 50*(1+(level/25.0)), 2, 0));
      fleet.add(new SpaceShip(1700, 600, 75, 50*(1+(level/25.0)), 2, 0));
      fleet.add(new SpaceShip(1400, 1300, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1400, 1400, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1400, 1500, 75, 50*(1+(level/25.0)), 1, -1));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-.75, 0, 200, -1});
      for (int i = 0; i < 3; i++){
        flightPlan.add(new float[] {-.75, 2, 0, -1, .04, .05, .06});
        flightPlan.add(new float[] {-.75, 2, 49, -1});
        flightPlan.add(new float[] {-.75, 2, 0, -1, .01, .02, .03, .07, .08, .09});
        flightPlan.add(new float[] {-.75, 2, 49, -1});
      }
      flightPlan.add(new float[] {-.75, 0, 0, 0, .04, .05, .06});
      flightPlan.add(new float[] {-.75, 0, 49, 49});
      flightPlan.add(new float[] {-.75, 0, 0, 0, .01, .02, .03, .07, .08, .09});
      flightPlan.add(new float[] {-.75, 0, 49, 49});
    }
    if(mode == 5) {
      fleet.add(new SpaceShip(1700, 200, 75, 50*(1+(level/25.0)), 1, 0));
      fleet.add(new SpaceShip(1600, 100, 75, 50*(1+(level/25.0)), 1, 0));
      fleet.add(new SpaceShip(1700, 0, 75, 50*(1+(level/25.0)), 1, 0));
      fleet.add(new SpaceShip(1700, 1200, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1600, 1100, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1700, 1000, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1700, 2200, 75, 50*(1+(level/25.0)), 1, -2));
      fleet.add(new SpaceShip(1600, 2100, 75, 50*(1+(level/25.0)), 1, -2));
      fleet.add(new SpaceShip(1700, 2000, 75, 50*(1+(level/25.0)), 1, -2));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-.75, 0, 500, -1});
      for (int i = 0; i < 6; i++){
        flightPlan.add(new float[] {-.75, 2, 0, -1, .01, .02, .03, .04, .05, .06, .07, .08, .09});
        flightPlan.add(new float[] {-.75, 2, 49, -1});
      }
      flightPlan.add(new float[] {-.75, 0, 0, 0, .01, .02, .03, .04, .05, .06, .07, .08, .09});
        flightPlan.add(new float[] {-.75, 0, 49, 49});
    }
    if(mode == 4) {
      fleet.add(new SpaceShip(1700, 700, 75, 50*(1+(level/25.0)), 1, 0));
      fleet.add(new SpaceShip(1600, 800, 75, 50*(1+(level/25.0)), 1, 0));
      fleet.add(new SpaceShip(1700, 900, 75, 50*(1+(level/25.0)), 1, 0));
      fleet.add(new SpaceShip(1700, -200, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1600, -100, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1700, 0, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1700, -1200, 75, 50*(1+(level/25.0)), 1, 2));
      fleet.add(new SpaceShip(1600, -1100, 75, 50*(1+(level/25.0)), 1, 2));
      fleet.add(new SpaceShip(1700, -1000, 75, 50*(1+(level/25.0)), 1, 2));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-.75, 0, 500, -1});
      for (int i = 0; i < 6; i++){
        flightPlan.add(new float[] {-.75, 2, 0, -1, .01, .02, .03, .04, .05, .06, .07, .08, .09});
        flightPlan.add(new float[] {-.75, 2, 49, -1});
      }
      flightPlan.add(new float[] {-.75, 0, 0, 0, .01, .02, .03, .04, .05, .06, .07, .08, .09});
        flightPlan.add(new float[] {-.75, 0, 49, 49});
    }
    if(mode == 3) {
      fleet.add(new SpaceShip(1900, 200, 75, 10*(1+(level/25.0)), 3, -1));
      fleet.add(new SpaceShip(1900, 400, 75, 10*(1+(level/25.0)), 3, -1));
      fleet.add(new SpaceShip(1900, 600, 75, 10*(1+(level/25.0)), 3, -1));
      fleet.add(new SpaceShip(1900, 800, 75, 10*(1+(level/25.0)), 3, -1));
      fleet.add(new SpaceShip(1700, 100, 250, 400*(1+(level/25.0)), 0, 1));
      fleet.add(new SpaceShip(1700, 500, 250, 400*(1+(level/25.0)), 0, 1));
      fleet.add(new SpaceShip(1700, 900, 250, 400*(1+(level/25.0)), 0, 1));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-1, 0, 300, -1});
      flightPlan.add(new float[] {-.5, 2, 0, 0, .01, .02, .03, .04});
      flightPlan.add(new float[] {-.5, 2, 49, 49});
      flightPlan.add(new float[] {-.5, -2, 0, 0, .01, .02, .03, .04});
      flightPlan.add(new float[] {-.5, -2, 49, 49});
      flightPlan.add(new float[] {-.5, -2, 0, 0, .01, .02, .03, .04});
      flightPlan.add(new float[] {-.5, -2, 49, 49});
      flightPlan.add(new float[] {-.5, 2, 0, 0, .01, .02, .03, .04});
      flightPlan.add(new float[] {-.5, 2, 49, 49});
    }
    if(mode == 2) {
      fleet.add(new SpaceShip(1600, 200, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1700, 100, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1700, 300, 75, 50*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1600, 400, 75, 50*(1+(level/25.0)), 3, 0));
      fleet.add(new SpaceShip(1600, 600, 75, 50*(1+(level/25.0)), 3, 0));
      fleet.add(new SpaceShip(1700, 500, 75, 50*(1+(level/25.0)), 3, 0));
      fleet.add(new SpaceShip(1700, 700, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1700, 900, 75, 50*(1+(level/25.0)), 1, -1));
      fleet.add(new SpaceShip(1600, 800, 75, 50*(1+(level/25.0)), 1, -1));
      flightPlan = new ArrayDeque<float[]>();
      for (int i = 0; i < 8; i++){
        flightPlan.add(new float[] {-1, 1, 30, 30});
        flightPlan.add(new float[] {-1, 1, 0, 0, .01, .02, .03, .07, .08, .09});
        flightPlan.add(new float[] {-1, 1, 30, 30});
        flightPlan.add(new float[] {-1, 1, 0, 0, .04, .05, .06});
      }
      for (int i = 0; i < 8; i++){
        flightPlan.add(new float[] {-1, -1, 30, 30});
        flightPlan.add(new float[] {-1, -1, 0, 0, .01, .02, .03, .07, .08, .09});
        flightPlan.add(new float[] {-1, -1, 30, 30});
        flightPlan.add(new float[] {-1, -1, 0, 0, .04, .05, .06});
      }
    }
    if(mode == 1) {
      fleet.add(new SpaceShip(1600, 300, 150, 200*(1+(level/25.0)), 4, -1));
      fleet.add(new SpaceShip(1600, 500, 150, 200*(1+(level/25.0)), 3, 0));
      fleet.add(new SpaceShip(1600, 700, 150, 200*(1+(level/25.0)), 4, 1));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-1, 0, 200, -1});
      flightPlan.add(new float[] {-1, 2, 24, 24});
      flightPlan.add(new float[] {-1, 2, 0, 0, .01, .02, .03});
      flightPlan.add(new float[] {-1, 2, 24, 24});
      flightPlan.add(new float[] {-1, 2, 0, 0, .01, .03});
      flightPlan.add(new float[] {0.5, 1, 24, 24});
      flightPlan.add(new float[] {0.5, 1, 0, 0, .01, .02, .03});
      flightPlan.add(new float[] {0.5, 1, 24, 24});
      flightPlan.add(new float[] {0.5, 1, 0, 0, .01, .03});
      flightPlan.add(new float[] {0.5, 1, 24, 24});
      flightPlan.add(new float[] {0.5, 1, 0, 0, .01, .02, .03});
      flightPlan.add(new float[] {0.5, 1, 24, 24});
      flightPlan.add(new float[] {0.5, 1, 0, 0, .01, .03});
      flightPlan.add(new float[] {0.5, -1, 24, 24});
      flightPlan.add(new float[] {0.5, -1, 0, 0, .01, .02, .03});
      flightPlan.add(new float[] {0.5, -1, 24, 24});
      flightPlan.add(new float[] {0.5, -1, 0, 0, .01, .03});
      flightPlan.add(new float[] {0.5, -1, 24, 24});
      flightPlan.add(new float[] {0.5, -1, 0, 0, .01, .02, .03});
      flightPlan.add(new float[] {0.5, -1, 24, 24});
      flightPlan.add(new float[] {0.5, -1, 0, 0, .01, .03});
      flightPlan.add(new float[] {-1, -2, 24, 24});
      flightPlan.add(new float[] {-1, -2, 0, 0, .01, .02, .03});
      flightPlan.add(new float[] {-1, -2, 24, 24});
      flightPlan.add(new float[] {-1, -2, 0, 0, .01, .03});
      flightPlan.add(new float[] {-1, -2, 24, 24});
      flightPlan.add(new float[] {-1, -2, 0, 0, .01, .02, .03});
      flightPlan.add(new float[] {-1, -2, 24, 24});
      flightPlan.add(new float[] {-1, -2, 0, 0, .01, .03});
      flightPlan.add(new float[] {-1, 2, 24, 24});
      flightPlan.add(new float[] {-1, 2, 0, 0, .01, .02, .03});
      flightPlan.add(new float[] {-1, 2, 24, 24});
      flightPlan.add(new float[] {-1, 2, 0, 0, .01, .03});
    }
    if(mode == 0) {
      fleet.add(new SpaceShip(1600, 200, 100, 100*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1600, 400, 100, 100*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1600, 600, 100, 100*(1+(level/25.0)), 1, 1));
      fleet.add(new SpaceShip(1600, 800, 100, 100*(1+(level/25.0)), 1, 1));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-1, 0, 200, -1});
      flightPlan.add(new float[] {-1, 2, 0, 0, .01, .02, .03, .04});
      flightPlan.add(new float[] {-1, 2, 49, 49});
      flightPlan.add(new float[] {-1, -2, 0, 0, .01, .02, .03, .04});
      flightPlan.add(new float[] {-1, -2, 49, 49});
      flightPlan.add(new float[] {-1, -2, 0, 0, .01, .02, .03, .04});
      flightPlan.add(new float[] {-1, -2, 49, 49});
      flightPlan.add(new float[] {-1, 2, 0, 0, .01, .02, .03, .04});
      flightPlan.add(new float[] {-1, 2, 49, 49});
    }
  }
    
  public void move(){
    if(bossTime) {
      rectMode(CENTER);
      fill(0, 0, 255);
      rect(width/2, 900, 500*boss.HP/boss.mHP, 50);
    }else {
      float[] temp;
      temp = flightPlan.poll();
      if (temp.length > 4){
        pew.play();
      }
      for (int x = fleet.size()-1; x >= 0; x--){
        fleet.get(x).isHit();
        if (fleet.get(x).HP <= 0){
          toExplode.add(fleet.get(x));
          fleet.get(x).explode();
          fleet.remove(x);
          if(player.cannon.charge != 100 && player.cannon.specialTimer == 0){
            player.cannon.charge += 10;
          }
        } else{
          fleet.get(x).move(temp[0],temp[1]);
          if (Arrays.binarySearch(temp, (x+1) / 100.0) >= 0){
            fleet.get(x).fire();
          }
        }
      }
      if (temp[2] > 0){
        temp[2]--;
        flightPlan.addFirst(temp);
      } else if (temp[3] >= 0){
        temp[2] = temp[3];
        flightPlan.add(temp);
      }
    }
  }
}
