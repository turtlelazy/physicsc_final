
public class BeamStructure extends HorizontalBeam implements Mass{
  public ConnectionPoint leftPoint,rightPoint,middlePoint;
  private int units;
  
  private Point lastaccessed = Point.NONE;


  public BeamStructure(float x, float y){
    super(x,y,PublicObjectConstants.beamDefaultLength,PublicObjectConstants.beamDefaultWidth);
    units = 1;
    leftPoint = new ConnectionPoint(x-w/2,y+PublicObjectConstants.barHeight,false);
    rightPoint = new ConnectionPoint(x+w/2,y+PublicObjectConstants.barHeight,false);
    middlePoint = new ConnectionPoint(x,y,true);
  }
  
  @Override
  public void drawObj(){
    super.drawObj();
    leftPoint.drawObj();
    rightPoint.drawObj();
    middlePoint.drawObj();
    
  }
  
  private void changeWidth(int units){
    this.units = units;
  }
  
  private void setWidth(){
    this.w = units * PublicObjectConstants.beamDefaultWidth;
  }
  
  public void run(){
    snapInteraction(
      connectionInteraction()
    );

    if(leftPoint.interaction()){
      lastaccessed = Point.LEFT;
    }
    else if(rightPoint.interaction()){
      lastaccessed = Point.RIGHT;
    }

    else{
      lastaccessed = Point.NONE;
    }

    w = calculatedWidth();
    x = leftPoint.x + w/2;
    moveWithPoint();
    drawObj();
  }
  
  public void snapInteraction(boolean connectionInteraction){
    float currentW = calculatedWidth();
    float remainder = currentW % 50;
    if(currentW <= PublicObjectConstants.beamDefaultWidth *1.1 || leftPoint.x >= middlePoint.x
        || rightPoint.x+5 <= middlePoint.x){
        resetBar();

        return;
     }

    if(remainder != 0 && !connectionInteraction){
      
      currentW = currentW - remainder;

      if(remainder > PublicObjectConstants.beamUnits / 2){
        currentW += PublicObjectConstants.beamUnits;
      }

      
    }
    if(lastaccessed == Point.RIGHT){
      rightPoint.x = leftPoint.x + currentW;
    }
    else if(lastaccessed == Point.LEFT){
      leftPoint.x = rightPoint.x - currentW;
    }
  }
  
  public void resetBar(){
    rightPoint.x = middlePoint.x + PublicObjectConstants.beamDefaultWidth / 2;
    leftPoint.x = middlePoint.x - PublicObjectConstants.beamDefaultWidth / 2;
  }
  
  public void previousSetting(){
    
  }
  
  public boolean connectionInteraction(){
    return connectionMouseInteraction(leftPoint,rightPoint);
  }
  
  public boolean connectionMouseInteraction(ConnectionPoint point1, ConnectionPoint point2){
    if(point1.interaction()){
      point1.moveX(mouseX);
      return true;
      
    }
    else if(point2.interaction()){
      point2.moveX(mouseX);
      return true;
    }
    return false;

  }
  
  public float calculatedWidth(){
    return rightPoint.x - leftPoint.x;
  }
  
  public void moveWithPoint(){
    this.y = middlePoint.y;
    leftPoint.y = middlePoint.y + PublicObjectConstants.barHeight;
    rightPoint.y = middlePoint.y + PublicObjectConstants.barHeight;

  }
  
  public int mass(){
    return 0;
  }
  
}
