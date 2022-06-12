public class HitZone{
  public float x,y,l,w;
  color c = color(255,255,255);
  PImage icon;
  Mouse mouse;
  MouseMode mode;
  public boolean active = false;;
  
  public HitZone(float x, float y, float l , float w, Mouse mouse, color c, MouseMode mode){
    this.x = x;
    this.y = y;
    this.w = w;
    this.l = l;
    this.c = c;
    this.mouse = mouse;
    this.mode = mode;
  }
  
  public void setImage(PImage icon){
    this.icon = icon;
  }
  
  public void mouseReleased(){
    if(mouseX >= this.x && mouseX <= this.x + this.l){
      if(mouseY >= this.y && mouseY <= this.y + this.w){
        mouse.cursorMode = this.mode;
        mouse.c = this.c;
      }
    }
    
  }
  
  public boolean touched(){
    return (mouseX >= this.x && mouseX <= this.x + this.l) && (mouseY >= this.y && mouseY <= this.y + this.w);
  }
  
  public void draw(){
    if(mode == mouse.cursorMode){
        fill(c);
        rectMode(CORNER);
        rect(x,y,l,w);
    }
    
     if(icon != null){
      image(icon,x,y,l,w);
    }

    

  }
  
  public void independentDraw(){
    if(active){
        fill(c);
        rectMode(CORNER);
        rect(x,y,l,w);
    }
    
    if(icon != null){
      image(icon,x,y,l,w);
    }
    
  
  }
  
  public void invert(){
    icon.filter(INVERT);
  }
  
  public void hide(){
  }
  
  
}
