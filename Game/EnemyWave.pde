import java.util.ArrayList;
import java.util.ArrayDeque;
import java.util.Arrays;
public class EnemyWave {
  public ArrayList<SpaceShip> fleet;
  private ArrayDeque<float[]> flightPlan;
  private Boss boss;
  public int mode;
  
  public EnemyWave(){
    this((int) random(4));
  }
  
  public EnemyWave(int mode) {
    boss = new Boss(0, 500+(level-1)*100);
    this.mode = mode;
    fleet = new ArrayList<SpaceShip>();
    if(mode == 2) {
      fleet.add(new SpaceShip(1600, 200, 75, 50*(1+(level/10.0)), 1, 1));
      fleet.add(new SpaceShip(1700, 100, 75, 50*(1+(level/10.0)), 1, 1));
      fleet.add(new SpaceShip(1700, 300, 75, 50*(1+(level/10.0)), 1, 1));
      fleet.add(new SpaceShip(1600, 400, 75, 50*(1+(level/10.0)), 1, 0));
      fleet.add(new SpaceShip(1600, 600, 75, 50*(1+(level/10.0)), 1, 0));
      fleet.add(new SpaceShip(1700, 500, 75, 50*(1+(level/10.0)), 1, 0));
      fleet.add(new SpaceShip(1700, 700, 75, 50*(1+(level/10.0)), 1, -1));
      fleet.add(new SpaceShip(1700, 900, 75, 50*(1+(level/10.0)), 1, -1));
      fleet.add(new SpaceShip(1600, 800, 75, 50*(1+(level/10.0)), 1, -1));
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
      fleet.add(new SpaceShip(1600, 300, 150, 200*(1+(level/10.0)), 4, -1));
      fleet.add(new SpaceShip(1600, 500, 150, 200*(1+(level/10.0)), 4, 0));
      fleet.add(new SpaceShip(1600, 700, 150, 200*(1+(level/10.0)), 4, 1));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-1, 0, 200, -1});
      flightPlan.add(new float[] {-1, 2, 50, 100});
      flightPlan.add(new float[] {0.5, 1, 50, 100});
      flightPlan.add(new float[] {0.5, -1, 100, 100});
      flightPlan.add(new float[] {-1, -2, 100, 100});
    }
    if(mode == 0) {
      fleet.add(new SpaceShip(1600, 200, 100, 100*(1+(level/10.0)), 1, 1));
      fleet.add(new SpaceShip(1600, 400, 100, 100*(1+(level/10.0)), 1, 1));
      fleet.add(new SpaceShip(1600, 600, 100, 100*(1+(level/10.0)), 1, 1));
      fleet.add(new SpaceShip(1600, 800, 100, 100*(1+(level/10.0)), 1, 1));
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
    if(mode == 2) {
      boss.render();
      rectMode(CENTER);
      fill(0, 0, 255);
      rect(width/2, 900, 100-boss.HP, 50);
    }
    float[] temp;
    temp = flightPlan.poll();
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
