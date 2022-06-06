import java.util.ArrayList;
import java.util.ArrayDeque;
public class EnemyWave{
  public ArrayList<SpaceShip> fleet;
  private ArrayDeque<float[]> flightPlan;
  
  public EnemyWave(){
    fleet = new ArrayList<SpaceShip>();
    fleet.add(new SpaceShip(1600, 200, 100, 100));
    fleet.add(new SpaceShip(1600, 400, 100, 100));
    fleet.add(new SpaceShip(1600, 600, 100, 100));
    fleet.add(new SpaceShip(1600, 800, 100, 100));
    flightPlan = new ArrayDeque<float[]>();
    flightPlan.add(new float[] {-1, 0, 200, 0});
    flightPlan.add(new float[] {-1, 2, 50, 100});
    flightPlan.add(new float[] {-1, -2, 100, 100});
    //add more here later
  }
  
  public EnemyWave(int mode) {
    fleet = new ArrayList<SpaceShip>();
    if(mode == 1) {
      fleet.add(new SpaceShip(1600, 300, 150, 200*(1+(level/10.0)*(level/10.0)), 2));
      fleet.add(new SpaceShip(1600, 500, 150, 200*(1+(level/10.0)*(level/10.0)), 2));
      fleet.add(new SpaceShip(1600, 700, 150, 200*(1+(level/10.0)*(level/10.0)), 2));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-1, 0, 200, 0});
      flightPlan.add(new float[] {-1, 2, 50, 100});
      flightPlan.add(new float[] {0.5, 1, 50, 100});
      flightPlan.add(new float[] {0.5, -1, 100, 100});
      flightPlan.add(new float[] {-1, -2, 100, 100});
    }
    if(mode == 0) {
      fleet.add(new SpaceShip(1600, 200, 100, 100*(1+(level/10.0)*(level/10.0))));
      fleet.add(new SpaceShip(1600, 400, 100, 100*(1+(level/10.0)*(level/10.0))));
      fleet.add(new SpaceShip(1600, 600, 100, 100*(1+(level/10.0)*(level/10.0))));
      fleet.add(new SpaceShip(1600, 800, 100, 100*(1+(level/10.0)*(level/10.0))));
      flightPlan = new ArrayDeque<float[]>();
      flightPlan.add(new float[] {-1, 0, 200, 0});
      flightPlan.add(new float[] {-1, 2, 50, 100});
      flightPlan.add(new float[] {-1, -2, 100, 100});
    }
  }
    
  public void move(){
    float[] temp;
    temp = flightPlan.poll();
    for (int x = fleet.size()-1; x >= 0; x--){
      fleet.get(x).isHit();
      if (fleet.get(x).HP <= 0){
        fleet.get(x).explode();
        fleet.remove(x);
      } else{
        fleet.get(x).move(temp[0],temp[1]);
        if (fleet.get(x).x % 40 == 0){
          fleet.get(x).fire(); //maybe space the firing out a bit
        }
      }
    }
    if (temp[2] > 0){
      temp[2]--;
      flightPlan.addFirst(temp);
    } else if (temp[3] > 0){
      temp[2] = temp[3];
      flightPlan.add(temp);
    }
  }
}
