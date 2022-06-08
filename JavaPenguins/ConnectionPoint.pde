public class ConnectionPoint{
  private boolean positive = false;
  private float range = 20;
  public float x,y;

  private ConnectionPoint connection;

  public ConnectionPoint(float x, float y, boolean positive){
    this.x = x;
    this.y = y;
    this.positive = positive;
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
      }
    }
  }
  
  public void drawObj(){
    if(!positive) {
      fill(255,255,255);
      rect(this.x,this.y - PublicObjectConstants.barHeight / 2,PublicObjectConstants.beamDefaultLength,PublicObjectConstants.barHeight);
      rectMode(CENTER);
    }
    
    if(positive)fill(255,0,0);
    else fill(0,0,255);
    
    circle(x,y,range*0.5);
    
    maintainConnection();
    
  }
    

}
