float movex = 0;
BeamStructure beam = new BeamStructure(200,50);
BeamStructure beam2 = new BeamStructure(400,50);

Penguin peng = new Penguin(200,200);
public void setup(){
  frameRate(30);
  size(500,500);
  background(0);
  peng.bluePenguin = loadImage("bluepeng.png");
  
  beam.leftPoint.connect(peng.point);
  beam.rightPoint.connect(beam2.middlePoint);
  
}

public void draw(){
  background(0);
  beam.run();  
  beam2.run();
  peng.run();

  //print(rectangle.mouseOn(mouseX, mouseY));
}
