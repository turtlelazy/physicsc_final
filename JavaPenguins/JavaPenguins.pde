float movex = 0;
Mouse mouseInstance = new Mouse();
BeamStructure beam = new BeamStructure(250,50, mouseInstance);
ConnectionPoint point = new ConnectionPoint(250,50,false,mouseInstance);
//ConnectionPoint mainPoint = new ConnectionPoint(250,20,false,mouseInstance);
HitZone cursor,beamChoose,pengChoose;
//BeamStructure beam2 = new BeamStructure(400,50);

boolean test = true;

//Penguin peng = new Penguin(200,200);
public void setup(){
  frameRate(30);
  size(500,500);
  background(0);
  point.connect(beam);
  point.hide = false;
  cursor  = new HitZone(0,height-40,width/3,40,mouseInstance,color(255,255,255), MouseMode.CURSOR);
  beamChoose  = new HitZone(width/3,height-40,width/3,40,mouseInstance,color(0,255,0), MouseMode.BEAM);
  pengChoose  = new HitZone(2* width/3,height-40,width/3,40,mouseInstance,color(0,0,255), MouseMode.PENGUIN);
  //mainPoint.connect(beam);
  //peng.bluePenguin = loadImage("bluepeng.png");
  
  //beam.leftPoint.connect(peng.point);
  //beam.rightPoint.connect(beam2.middlePoint);
  
}

public void draw(){
  background(0);
  //beam.run(0,0,0);  
  //beam2.run();
  //peng.run();
  rectMode(CORNER);
  
  //mainPoint.drawObj();
  //beam.run();
  if(test){
      point.angle = PI/4;
  }
  else{
      point.angle = 0;

  }
  
  
  point.drawObj();
  
  cursor.draw();
  beamChoose.draw();
  pengChoose.draw();
  mouseInstance.draw();
  //print(rectangle.mouseOn(mouseX, mouseY));
}

public void mouseReleased(){
  cursor.mouseReleased();
  beamChoose.mouseReleased();
  pengChoose.mouseReleased();
  
}

public void keyPressed(){
  if(key == 113){
    test = !test;
  }
}
