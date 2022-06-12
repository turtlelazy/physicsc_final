
public class HorizontalBeam{
  protected float x, y, l, w;
  private int length;
  private boolean held = false;
  
  public HorizontalBeam(float x, float y, float l, float w){
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
  }
  
  public HorizontalBeam(float x, float y){
    //default is 200 x 200
    this(x,y,100,100);
  }
  
  public void drawBar(float x, float y, float l,float w){
    fill(255,255,255);
    rectMode(CENTER);
    rect(x,y,w,l);
  }
  
  public void drawBar(float x, float y, float l,float w, float abovex, float abovey){
    pushMatrix();
    translate(x-abovex,0);
    fill(255,255,255);
    rectMode(CENTER);
    rect(0,0,w,l);
    
    popMatrix();
  }
  
  public void drawObj(){
    drawBar(x,y,l,w);
  }
  
  public void move(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public boolean mouseOn(float mousex,float mousey){
    
    boolean xRange = mousex >= x - w/2 - 50 && mousex <= x + w/2 + 50;
    boolean yRange = mousey >= y - l/2 - 50 && mousey <= y + l/2 + 50;
    return xRange && yRange;
  }
  
  public boolean mouseOn(){
    return mouseOn(mouseX,mouseY);
  }
  
  public boolean held(){
    return mouseOn() && mousePressed;
  }
  
  public void clickedOn(){
    
  }
  
  public float x(){return this.x;}
  public float y(){return this.y;}

}
