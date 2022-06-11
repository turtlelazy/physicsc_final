public class Mouse{
  public MouseMode cursorMode = MouseMode.CURSOR;
  public color c = color(255,255,255);
  
  public void spawn(ConnectionPoint point){
    if(cursorMode == MouseMode.PENGUIN){
      point.connect(new Penguin(point.x,point.y, this));
    }
    else if(cursorMode == MouseMode.BEAM){
      point.connect(new BeamStructure(point.x,point.y, this));

    }
  }
  
  public void run(){
    
  }
  
  public void draw(){
    fill(c);
    rectMode(CENTER);
    rect(mouseX,mouseY,10,10);
  }
  
  
  
}
