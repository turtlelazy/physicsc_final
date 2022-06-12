
public class BeamStructure extends HorizontalBeam implements Mass{
  public ConnectionPoint leftPoint,rightPoint,middlePoint;
  private int units;
  boolean motion = false;
  private Point lastaccessed = Point.NONE;

  public BeamStructure(float x, float y, Mouse mouseInstance){
    super(x,y,PublicObjectConstants.beamDefaultLength,PublicObjectConstants.beamDefaultWidth);
    units = 1;
    leftPoint = new ConnectionPoint(x-w/2,y+PublicObjectConstants.barHeight,false,mouseInstance);
    rightPoint = new ConnectionPoint(x+w/2,y+PublicObjectConstants.barHeight,false,mouseInstance);
    middlePoint = new ConnectionPoint(x,y,true,mouseInstance);
  }
  
  @Override
  public void drawObj(){
    leftPoint.motion = this.motion;
    rightPoint.motion = this.motion;
    super.drawBar(this.x,this.y,this.l,this.w,middlePoint.x,middlePoint.y);
    leftPoint.drawObj(middlePoint.x,middlePoint.y, middlePoint.angle);
    rightPoint.drawObj(middlePoint.x,middlePoint.y,middlePoint.angle);
    middlePoint.drawObj();
  }
  
  public ConnectionPoint connectionPoint(){
    return middlePoint;
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
  
  public float mass(){
    return leftPoint.mass() + rightPoint.mass();
  }
  
  public float netRotate(float angle){
    float g = PublicObjectConstants.g;
    float pixelsPerMeter = 1000;
    //float leftMidDist = dist(leftPoint.x,middlePoint.x,leftPoint.y,middlePoint.y) / pixelsPerMeter;
    //float rightMidDist = dist(rightPoint.x,middlePoint.x,rightPoint.y,middlePoint.y) / pixelsPerMeter;
    float leftMidDist = abs(leftPoint.x-middlePoint.x) / pixelsPerMeter;
    float rightMidDist = abs(rightPoint.x-middlePoint.x) / pixelsPerMeter;
    
    float netTorque = g * sin(PI/2-angle) * (leftPoint.mass() * leftMidDist - rightPoint.mass() * rightMidDist);
    float inertia = leftPoint.mass() * pow(leftMidDist,2) + rightPoint.mass() * pow(rightMidDist,2);
    if(inertia == 0) return 0;
    float rotateAngle = netTorque / inertia * (1/ frameRate);    
    return rotateAngle;
    
    
  }
  
  public void motion(boolean motion){
    this.motion = motion;
  }
  
}
