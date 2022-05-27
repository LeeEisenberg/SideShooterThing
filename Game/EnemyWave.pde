import java.util.ArrayList;
import java.util.ArrayDeque;
public class EnemyWave{
  public ArrayList<SpaceShip> fleet;
  private ArrayDeque<float[]> flightPlan;
  
  public EnemyWave(){
    fleet = new ArrayList<SpaceShip>();
    //add randomness here later
    flightPlan = new ArrayDeque<float[]>();
    flightPlan.add(new float[] {-1, 0});
    //add more here later
  }
    
  public void move(){
    float[] temp;
    temp = flightPlan.poll();
    for (int x = fleet.size()-1; x >= 0; x--){
      //add hit detection here
      if (fleet.get(x).HP <= 0){
        fleet.remove(x);
      } else{
        fleet.get(x).move(temp[0],temp[1]);
        //fleet.get(x).fire(); //maybe space the firing out a bit
      }
    }
  }
}
