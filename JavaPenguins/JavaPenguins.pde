float movex = 0;
Mouse mouseInstance = new Mouse();
BeamStructure beam = new BeamStructure(0,0, mouseInstance);
HitZone cursor,beamChoose,pengChoose;
//BeamStructure beam2 = new BeamStructure(400,50);

//Penguin peng = new Penguin(200,200);
public void setup(){
  frameRate(30);
  size(500,500);
  background(0);
  cursor  = new HitZone(0,height-40,width/3,40,mouseInstance,color(255,255,255), MouseMode.CURSOR);
  beamChoose  = new HitZone(width/3,height-40,width/3,40,mouseInstance,color(0,255,0), MouseMode.BEAM);
  pengChoose  = new HitZone(2* width/3,height-40,width/3,40,mouseInstance,color(0,0,255), MouseMode.PENGUIN);
  //peng.bluePenguin = loadImage("bluepeng.png");
  
  //beam.leftPoint.connect(peng.point);
  //beam.rightPoint.connect(beam2.middlePoint);
  
}

public void draw(){
  background(0);
  beam.run();  
  //beam2.run();
  //peng.run();
  rectMode(CORNER);
  
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
