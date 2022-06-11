public class HitZone{
  public float x,y,l,w;
  color c = color(255,255,255);
  Mouse mouse;
  MouseMode mode;
  public HitZone(float x, float y, float l , float w, Mouse mouse, color c, MouseMode mode){
    this.x = x;
    this.y = y;
    this.w = w;
    this.l = l;
    this.c = c;
    this.mouse = mouse;
    this.mode = mode;
  }
  
  public void mouseReleased(){
    if(mouseX >= this.x && mouseX <= this.x + this.l){
      if(mouseY >= this.y && mouseY <= this.y + this.w){
        mouse.cursorMode = this.mode;
        mouse.c = this.c;
      }
    }
    
  }
  
  public void draw(){
    fill(c);
    rectMode(CORNER);
    rect(x,y,l,w);
    
  }
  
  
}
