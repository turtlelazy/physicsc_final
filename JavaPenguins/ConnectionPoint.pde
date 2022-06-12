public class ConnectionPoint{
  private boolean positive = false;
  private float range = 20;
  public float x,y;
  public float angle = 0;
  private ConnectionPoint connection;
  private Mass connectedMass;
  private Mouse mouseInstance;
  public boolean hide = false;
  
  public ConnectionPoint(float x, float y, boolean positive, Mouse mouseInstance){
    this.x = x;
    this.y = y;
    this.positive = positive;
    this.mouseInstance = mouseInstance;
  }
  
  public void connect(Mass mass){
    this.connectedMass = mass;
    connection = mass.connectionPoint();
    connect(connection);
  }
  
  public boolean connect(ConnectionPoint connection){
    if(connection.positive ^ this.positive){
      this.connection = connection;
      connection.connection = this;
      return true;
    }
    
    return false;
  }
  
  public boolean pointAttraction(ConnectionPoint otherPoint){
    return (this.positive ^ otherPoint.positive) && distance(otherPoint) < range;
  }
  
  public float distance(ConnectionPoint otherPoint){
    return (float)dist(this.x,this.y,otherPoint.x,otherPoint.y);
  }
  
  public boolean interaction(){
    return interactionBasic() && mouseInstance.cursorMode == MouseMode.CURSOR;
  }
  
  public boolean interactionBasic(){
    boolean mouseOn = dist(this.x,this.y,mouseX,mouseY) < range;
    return mouseOn && mousePressed;
  }
  
  public void move(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public void moveX(float x){
    move(x,this.y);
  }
  
  public void maintainConnection(){
    if(connection != null){
      if(this.positive){
        this.x = connection.x;
        this.y = connection.y;
        this.angle = connection.angle;
      }
    }
  }
  
  public void drawObj(){

    pushMatrix(); //OPENING MATRIX
    
    

    if(!positive) {
      translate(x,y);
      rotate(angle);
      fill(255,255,255);
      rectMode(CENTER);
      rect(0,0 - PublicObjectConstants.barHeight / 2,PublicObjectConstants.beamDefaultLength,PublicObjectConstants.barHeight);
      fill(0,0,255);

    }
    else{
        fill(255,0,0);
    }
    
    
    circle(0,0,range*0.5);
    

    
    maintainConnection();
    spawn();
    if(connectedMass != null) connectedMass.run();
    popMatrix(); //CLOSING MATRIX

    
  }
  
  public void drawObj(float abovex, float abovey, float aboveAng){

    pushMatrix(); //OPENING MATRIX
    
    

    if(!positive) {
      translate(x - abovex,y - abovey);
      fill(255,255,255);
      rectMode(CENTER);
      rect(0,0 - PublicObjectConstants.barHeight / 2,PublicObjectConstants.beamDefaultLength,PublicObjectConstants.barHeight);
      fill(0,0,255);
      angle = aboveAng / -2; THIS WAS FOR TestING
      rotate(-aboveAng + angle);

    }
    else{
        fill(255,0,0);
    }
    
    
    circle(0,0,range*0.5);
    

    
    maintainConnection();
    spawn();
    if(connectedMass != null) connectedMass.run();
    popMatrix(); //CLOSING MATRIX

    
  }
  
  public void spawn(){
    if(interactionBasic() && !positive && connection == null){
      mouseInstance.spawn(this);
    }
  }
    

}
