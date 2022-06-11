public class Penguin implements Mass{
  
  public float x,y;
  private ConnectionPoint point;
  public PImage bluePenguin = loadImage("bluepeng.png");

  public Penguin(float x, float y,Mouse mouseInstance){
    this.x = x;
    this.y = y;
    
    point = new ConnectionPoint(x,y,true,mouseInstance);
  }
  
  public void drawPeng(){
    float defaultWidth = 100;
    
    image(bluePenguin,x-defaultWidth/2,y-5,defaultWidth,defaultWidth);
  }
  
  public void drawObj(){
    drawPeng();
    point.drawObj();
  }
  
  public void run(){
    this.x = point.x;
    this.y = point.y;
    drawObj();
  }
  
  public int mass(){
    return 0;
  }
  public ConnectionPoint connectionPoint(){
    return point;
  }
  
  
}
