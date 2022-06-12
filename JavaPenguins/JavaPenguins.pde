Mouse mouseInstance = new Mouse();
BeamStructure beam;
ConnectionPoint point;
//ConnectionPoint mainPoint = new ConnectionPoint(250,20,false,mouseInstance);
HitZone cursor,beamChoose,pengChoose0,pengChoose1,pengChoose2,resetScene,playScene,hideInstructions;
//BeamStructure beam2 = new BeamStructure(400,50);
float testvar = 0;
boolean test;
float hitzoneHeight = 70;
String line0 = "To hide the instructions, click on them.";
String line1 = "Click on the tiles on the bottom row to switch the cursor's mode.";
String line2 = "The cursor option lets you adjust the length of the beams.";
String line3 = "The penguin options places penguins of different masses.";
String line4 = "On the right, the play button will animate/stop the figure.";
String line5 = "On the right, the trash button will reset the figure.";
String line6 = "One Blue = Two pinks. One yellow = Three Pinks";



//Penguin peng = new Penguin(200,200);
public void setup(){

  frameRate(30);
  size(500,500);
  background(0);
  test = false;
  beam = new BeamStructure(250,50, mouseInstance);
  point = new ConnectionPoint(250,50,false,mouseInstance);
  point.connect(beam);
  point.hide = false;
  float boxCount = 5;

  cursor  = new HitZone(0,height-hitzoneHeight,width/boxCount,hitzoneHeight,mouseInstance,color(255,255,255), MouseMode.CURSOR);
  beamChoose  = new HitZone(width/boxCount,height-hitzoneHeight,width/5,hitzoneHeight,mouseInstance,color(165,42,42), MouseMode.BEAM);
  pengChoose0  = new HitZone(2* width/boxCount,height-hitzoneHeight,width/boxCount,hitzoneHeight,mouseInstance,color(255,192,203), MouseMode.PENGUIN);
  pengChoose1  = new HitZone(3* width/boxCount,height-hitzoneHeight,width/boxCount,hitzoneHeight,mouseInstance,color(0,0,255), MouseMode.PENGUIN1);
  pengChoose2  = new HitZone(4* width/boxCount,height-hitzoneHeight,width/boxCount,hitzoneHeight,mouseInstance,color(255,255,0), MouseMode.PENGUIN2);
  resetScene = new HitZone(4* width/boxCount,height-hitzoneHeight * 2,width/boxCount,hitzoneHeight,mouseInstance,color(255,0,0), MouseMode.CURSOR);
  playScene = new HitZone(4* width/boxCount,height-hitzoneHeight * 3,width/boxCount,hitzoneHeight,mouseInstance,color(0,255,0), MouseMode.CURSOR);
  hideInstructions = new HitZone(0,height-hitzoneHeight-105,4 * width/boxCount,105,mouseInstance,color(0,0,0), MouseMode.CURSOR);
  hideInstructions.active = true;
  
  beamChoose.setImage(loadImage("beam.png"));
  cursor.setImage(loadImage("cursor.png"));
  pengChoose0.setImage(loadImage("pinkpeng.png"));
  pengChoose1.setImage(loadImage("bluepeng.png"));
  pengChoose2.setImage(loadImage("yellowpeng.png"));
  resetScene.setImage(loadImage("trash.png"));
  playScene.setImage(loadImage("play.png"));
  
  resetScene.invert();
  playScene.invert();
  //cursor.invert();
  //mainPoint.connect(beam);
  //peng.bluePenguin = loadImage("bluepeng.png");
  
  //beam.leftPoint.connect(peng.point);
  //beam.rightPoint.connect(beam2.middlePoint);
  
}

public void draw(){
  background(0);
  textSize(15);
  
  text(line0,0,height-hitzoneHeight - 90);
  text(line1,0,height-hitzoneHeight - 75);
  text(line2,0,height-hitzoneHeight - 60);
  text(line3,0,height-hitzoneHeight - 45);
  text(line4,0,height-hitzoneHeight - 30);
  text(line5,0,height-hitzoneHeight - 15);
  text(line6,0,height-hitzoneHeight - 0);
  hideInstructions.independentDraw();
  //beam.run(0,0,0);  
  //beam2.run();
  //peng.run();
  rectMode(CORNER);
  
  //mainPoint.drawObj();
  //beam.run();
  if(test){
      point.motion = true;
      playScene.active = true;
      
  }
  else{
      point.motion = false;
      playScene.active = false;


  }
   
  
  point.drawObj(0,0,0);
  cursor.draw();
  beamChoose.draw();
  pengChoose0.draw();
  pengChoose1.draw();
  pengChoose2.draw();
  resetScene.draw();
  playScene.independentDraw();

  mouseInstance.draw();
  //System.out.println(beam.netRotate(point.angle));
  //print(rectangle.mouseOn(mouseX, mouseY));
  
  System.out.println("90 Degrees:" +beam.netRotate(PI/2) + " 0 Degrees:"+beam.netRotate(0) + " 180 Degrees:"+beam.netRotate(PI));
  if(point.omega > testvar) testvar = point.omega;
  System.out.println(testvar);
}

public void mouseReleased(){
  cursor.mouseReleased();
  beamChoose.mouseReleased();
  pengChoose0.mouseReleased();
  pengChoose1.mouseReleased();
  pengChoose2.mouseReleased();
  resetScene.mouseReleased();
  playScene.mouseReleased();
  if(resetScene.touched()){
    setup();
  }
  if(playScene.touched()){
    test = !test;
  }
  if(hideInstructions.touched()){
    hideInstructions.active = true;
  }

}

public void keyPressed(){
  if(key == 113){
    test = !test;
  }
}
