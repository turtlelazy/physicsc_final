public class Penguin implements Mass{
  
  public float x,y;
  private ConnectionPoint point;
  public PImage bluePenguin = loadImage("bluepeng.png");
  public PImage yellowPenguin = loadImage("yellowpeng.png");
  public PImage pinkPenguin = loadImage("pinkpeng.png");


  public PImage penguin = pinkPenguin;

  private float mass = 10;
  boolean motion = false;
  
  public Penguin(float x, float y,Mouse mouseInstance){
    this.x = x;
    this.y = y;
    
    point = new ConnectionPoint(x,y,true,mouseInstance);
  }
  
  public Penguin(float x, float y, Mouse mouseInstance, int mode){
    this(x,y,mouseInstance);
    if(mode == 1){
      mass += mass * mode;
      penguin = bluePenguin;
    }
    else if(mode == 2){
      mass += mass * mode;
      penguin = yellowPenguin;
    }
    
  }
  
  public void drawPeng(){
    float defaultWidth = 100;
    
    image(penguin,-defaultWidth/2,-5,defaultWidth,defaultWidth);
  }
  
  public void drawPeng(float abovex, float abovey){
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
  
  public float mass(){
    return mass;
  }
  public ConnectionPoint connectionPoint(){
    return point;
  }
  
  public float netRotate(float angle){
    return 0;
  }
  public void motion(boolean motion){}

  
  
}
