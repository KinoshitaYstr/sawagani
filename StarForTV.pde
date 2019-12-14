class StarForTV{
  float y;
  float sideW;
  float w,h;
  float moonSize;
  float starSize;
  ArrayList<Float> frontBuildingHeight = new ArrayList<Float>();
  ArrayList<Float> leftBuildingHeight = new ArrayList<Float>();
  ArrayList<Float> rightBuildingHeight = new ArrayList<Float>();
  float buildingWidth;
  float windowSize;
  int dustSize;
  ArrayList<Float> frontWindowX = new ArrayList<Float>();
  ArrayList<Float> frontWindowY = new ArrayList<Float>();
  ArrayList<Float> leftWindowX = new ArrayList<Float>();
  ArrayList<Float> leftWindowY = new ArrayList<Float>();
  ArrayList<Float> rightWindowX = new ArrayList<Float>();
  ArrayList<Float> rightWindowY = new ArrayList<Float>();
  ArrayList<Dust> dust = new ArrayList<Dust>();
  StarForTV(){
    this.w = scen.getAllWidth()*0.65;
    this.sideW = (w-scen.getFrontWidth())/2;
    this.h = w*0.61;
    this.y = 0.15*scen.getHeight();
    this.starSize = 40;
    this.moonSize = this.starSize*1.1;
    this.buildingWidth = scen.getFrontWidth()/15;
    this.createBuildingHeight();
    this.windowSize = buildingWidth/4;
    this.createWindow();
    this.dustSize = 20;
    this.createDust();
  }
  void createDust(){
    int i;
    for(i = 0;i < this.dustSize;i++) this.dust.add(new Dust(new PVector(scen.getFrontWidth()/2,y+h/5),this.y));
  }
  void createWindow(){
    this.createLeftWindow();
    this.createFrontWindow();
    this.createRightWindow();
  }
  void createFrontWindow(){
    int i,j;
    int size;
    for(i = 0;i < this.frontBuildingHeight.size();i++){
      size = int(random(5,10));
      for(j = 0;j < size;j++){
        this.frontWindowX.add(random(i*this.buildingWidth+this.windowSize/4,(i+1)*this.buildingWidth-this.windowSize*5/4));
        this.frontWindowY.add(random(this.frontBuildingHeight.get(i)+this.windowSize/4,y+h-this.windowSize*5));
      }
    }
  }
  void createLeftWindow(){
    int i,j;
    int size;
    for(i = 0;i < this.leftBuildingHeight.size();i++){
      size = int(random(5,10));
      for(j = 0;j < size;j++){
        this.leftWindowX.add(random(i*this.buildingWidth+this.windowSize/4,(i+1)*this.buildingWidth-this.windowSize*5/4));
        this.leftWindowY.add(random(this.leftBuildingHeight.get(i)+this.windowSize/4,y+h-this.windowSize*5));
      }
    }
  }
  void createRightWindow(){
    int i,j;
    int size;
    for(i = 0;i < this.rightBuildingHeight.size();i++){
      size = int(random(5,10));
      for(j = 0;j < size;j++){
        this.rightWindowX.add(random(i*this.buildingWidth+this.windowSize/4,(i+1)*this.buildingWidth-this.windowSize*5/4));
        this.rightWindowY.add(random(this.rightBuildingHeight.get(i)+this.windowSize/4,y+h-this.windowSize*5));
      }
    }
  }
  void createBuildingHeight(){
    this.createFrontBuildingHeight();
    this.createLeftBuildingHeight();
    this.createRightBuildingHeight();
  }
  void createFrontBuildingHeight(){
    int i;
    int size;
    size = int(scen.getFrontWidth()/this.buildingWidth)+1;
    for(i = 0;i < size;i++){
      this.frontBuildingHeight.add(random(y+h/3,y+h*4/5));
    }
  }
  void createLeftBuildingHeight(){
    int i;
    int size;
    size = int(this.sideW/this.buildingWidth)+1;
    for(i = 0;i < size;i++){
      this.leftBuildingHeight.add(random(y+h/3,y+h*4/5));
    }
  }
  void createRightBuildingHeight(){
    int i;
    int size;
    size = int(this.sideW/this.buildingWidth)+1;
    for(i = 0;i < size;i++){
      this.rightBuildingHeight.add(random(y+h/3,y+h*4/5));
    }
  }
  void display(){
    this.displayMoon();
    this.displayStar();
    this.displayBuilding();
    this.displayWindow();
  }
  void displayStar(){
    scen.beginFrontDraw();
    scen.front.offscreen.noStroke();
    scen.front.offscreen.fill(color(0,255,0));
    scen.front.offscreen.ellipse(scen.getFrontWidth()/2, y+h/5,this.starSize,this.starSize);
    scen.endFrontDraw();
  }
  void displayMoon(){
    scen.beginFrontDraw();
    scen.front.offscreen.noStroke();
    scen.front.offscreen.fill(color(255,255,0));
    scen.front.offscreen.ellipse(scen.getFrontWidth()*0.8, y+h/5,this.moonSize,this.moonSize);
    scen.endFrontDraw();
  }
  void displayBuilding(){
    this.displayLeftBuilding();
    this.displayFrontBuilding();
    this.displayRightBuilding();
  }
  void displayLeftBuilding(){
    int i;
    scen.beginLeftDraw();
    scen.left.offscreen.noStroke();
    scen.left.offscreen.fill(color(0));
    scen.left.offscreen.beginShape();
    scen.left.offscreen.vertex(scen.getSideWidth()-sideW,y+h);
    for(i = 0;i < this.leftBuildingHeight.size();i++){
      scen.left.offscreen.vertex(scen.getSideWidth()-sideW+i*this.buildingWidth,this.leftBuildingHeight.get(i));
      scen.left.offscreen.vertex(scen.getSideWidth()-sideW+(i+1)*this.buildingWidth,this.leftBuildingHeight.get(i));
    }
    scen.left.offscreen.vertex(scen.getSideWidth(),y+h);
    scen.left.offscreen.endShape();
    scen.endLeftDraw();
  }
  void displayFrontBuilding(){
    int i;
    scen.beginFrontDraw();
    scen.front.offscreen.noStroke();
    scen.front.offscreen.fill(color(0));
    scen.front.offscreen.beginShape();
    scen.front.offscreen.vertex(0,y+h);
    for(i = 0;i < this.frontBuildingHeight.size();i++){
      scen.front.offscreen.vertex(i*this.buildingWidth,this.frontBuildingHeight.get(i));
      scen.front.offscreen.vertex((i+1)*this.buildingWidth,this.frontBuildingHeight.get(i));
    }
    scen.front.offscreen.vertex(scen.getFrontWidth(),y+h);
    scen.front.offscreen.endShape();
    scen.endFrontDraw();
  }
  void displayRightBuilding(){
    int i;
    float startX;
    startX = this.sideW-this.rightBuildingHeight.size()*this.buildingWidth;
    scen.beginRightDraw();
    scen.right.offscreen.noStroke();
    scen.right.offscreen.fill(color(0));
    scen.right.offscreen.beginShape();
    scen.right.offscreen.vertex(startX,y+h);
    for(i = 0;i < this.rightBuildingHeight.size();i++){
      scen.right.offscreen.vertex(startX+i*this.buildingWidth,this.rightBuildingHeight.get(i));
      scen.right.offscreen.vertex(startX+(i+1)*this.buildingWidth,this.rightBuildingHeight.get(i));
    }
    scen.right.offscreen.vertex(this.sideW,y+h);
    scen.right.offscreen.endShape();
    scen.endRightDraw();
  }
  void displayWindow(){
    this.displayFrontWindow();
    this.displayLeftWindow();
    this.displayRightWindow();
  }
  void displayLeftWindow(){
    int i;
    scen.beginLeftDraw();
    scen.left.offscreen.noStroke();
    scen.left.offscreen.fill(color(255,246,127));
    for(i = 0;i < this.leftWindowX.size();i++){
      scen.left.offscreen.rect(scen.getSideWidth()-sideW+this.leftWindowX.get(i),this.leftWindowY.get(i),this.windowSize,this.windowSize);
    }
    scen.endLeftDraw();
  }
  void displayFrontWindow(){
    int i;
    scen.beginFrontDraw();
    scen.front.offscreen.noStroke();
    scen.front.offscreen.fill(color(255,246,127));
    for(i = 0;i < this.frontWindowX.size();i++){
      scen.front.offscreen.rect(this.frontWindowX.get(i),this.frontWindowY.get(i),this.windowSize,this.windowSize);
    }
    scen.endFrontDraw();
  }
  void displayRightWindow(){
    int i;
    float startX;
    startX = this.sideW-this.rightBuildingHeight.size()*this.buildingWidth;
    scen.beginRightDraw();
    scen.right.offscreen.noStroke();
    scen.right.offscreen.fill(color(255,246,127));
    for(i = 0;i < this.rightWindowX.size();i++){
      scen.right.offscreen.rect(startX+this.rightWindowX.get(i),this.rightWindowY.get(i),this.windowSize,this.windowSize);
    }
    scen.endRightDraw();
  }
  void broken(){
    int i;
    scen.beginFrontDraw();
    if(this.starSize >= 0){
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(color(0,255,0));
      scen.front.offscreen.ellipse(scen.getFrontWidth()/2, y+h/5,this.starSize,this.starSize);
      this.starSize--;
    }else{
      for(i = 0;i < this.dustSize;i++) this.dust.get(i).run();
    }
    scen.endFrontDraw();
  }
}
class Dust{
  float size;
  PVector pos;
  PVector spd;
  float rate;
  float maxY;
  Dust(PVector pos,float maxY){
    this.pos = pos;
    this.size = random(5,10);
    this.spd = new PVector(random(-5,5),random(-5,5));
    this.rate = random(10,15);
    this.maxY = maxY;
  }
  void rogic(){
    this.rate--;
    this.pos.add(this.spd);
  }
  void display(){
    if(this.rate > 0 && this.pos.y > this.maxY){
      scen.front.offscreen.strokeWeight(1);
      scen.front.offscreen.stroke(color(0,255,0));
      scen.front.offscreen.noFill();
      scen.front.offscreen.rect(0, 0, this.size, this.size);
    }
  }
  void setMatrix(){
    scen.front.offscreen.translate(this.pos.x, this.pos.y);
  }
  void run(){
    this.rogic();
    scen.front.offscreen.pushMatrix();
    this.setMatrix();
    this.display();
    scen.front.offscreen.popMatrix();
  }
}