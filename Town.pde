class Town{
  ArrayList<Float> frontBuildingHeight = new ArrayList<Float>();
  ArrayList<Float> frontBuildingWindowX = new ArrayList<Float>();
  ArrayList<Float> frontBuildingWindowY = new ArrayList<Float>();
  ArrayList<Float> rightBuildingHeight = new ArrayList<Float>();
  ArrayList<Float> rightBuildingWindowX = new ArrayList<Float>();
  ArrayList<Float> rightBuildingWindowY = new ArrayList<Float>();
  ArrayList<Float> leftBuildingHeight = new ArrayList<Float>();
  ArrayList<Float> leftBuildingWindowX = new ArrayList<Float>();
  ArrayList<Float> leftBuildingWindowY = new ArrayList<Float>();
  float buildingWidth;
  float buildingWindowSize;
  color buildingColor;
  color buildinWindowColor;
  Town(){
    this.initBuilding();
  }
  void initBuilding(){
    int size = 20;
    this.buildingWidth = scen.getFrontWidth()/size;
    this.buildingColor = color(0);
    this.initFrontBuilding();
    this.initRightBuilding();
    this.initLeftBuilding();
    this.initBuildingWindow();
  }
  void initBuildingWindow(){
    this.buildinWindowColor = color(255,246,127);
    this.buildingWindowSize = this.buildingWidth/3;
    this.initFrontBuildingWindows();
    this.initRightBuildingWindows();
    this.initLeftBuildingWindows();
  }
  void initFrontBuilding(){
    int size;
    int i;
    size = int(scen.getFrontWidth()/this.buildingWidth);
    for(i = 0;i < size;i++){
      this.frontBuildingHeight.add(random(0.4,0.7)*scen.getHeight());
    }
  }
  void initRightBuilding(){
    int i;
    int max;
    max = int(scen.getSideWidth()/this.buildingWidth)+1;
    for(i = 0;i < max;i++){
      this.rightBuildingHeight.add(random(0.4,0.7)*scen.getHeight());
    }
  }
  void initLeftBuilding(){
    int i;
    int max;
    max = int(scen.getSideWidth()/this.buildingWidth)+1;
    for(i = 0;i < max;i++){
      this.leftBuildingHeight.add(random(0.4,0.7)*scen.getHeight());
    }
  }
  void initFrontBuildingWindows(){
    int i;
    int j;
    int max;
    float y;
    for(i = 0;i < this.frontBuildingHeight.size();i++){
      max = int(random(5,7));
      y = this.frontBuildingHeight.get(i);
      for(j = 0;j < max;j++){
        this.frontBuildingWindowY.add(random(y,scen.getHeight()-this.buildingWindowSize/3));
        this.frontBuildingWindowX.add(random(i*this.buildingWidth+this.buildingWindowSize/3,i*this.buildingWidth+this.buildingWidth-this.buildingWindowSize*4/3));
      }
    }
  }
  void initRightBuildingWindows(){
    int i;
    int j;
    int max;
    float y;
    for(i = 0;i < this.rightBuildingHeight.size();i++){
      y = this.rightBuildingHeight.get(i);
      max = int(random(5,7));
      for(j = 0;j < max;j++){
        this.rightBuildingWindowX.add(random(i*this.buildingWidth+this.buildingWindowSize/3,i*this.buildingWidth+this.buildingWidth-this.buildingWindowSize*4/3));
        this.rightBuildingWindowY.add(random(y,scen.getHeight()-this.buildingWindowSize/3));
      }
    }
  }
  void initLeftBuildingWindows(){
    int i;
    int j;
    int max;
    float y;
    for(i = 0;i < this.leftBuildingHeight.size();i++){
      y = this.leftBuildingHeight.get(i);
      max = int(random(5,7));
      for(j = 0;j < max;j++){
        this.leftBuildingWindowX.add(scen.getSideWidth()-random(i*this.buildingWidth+this.buildingWindowSize*4/3,i*this.buildingWidth+this.buildingWidth-this.buildingWindowSize/3));
        this.leftBuildingWindowY.add(random(y,scen.getHeight()-this.buildingWindowSize/3));
      }
    }
  }
  void displayFront(){
    this.displayFrontBuilding();
    this.displayFrontBuildingWindow();
  }
  void displayFrontBuilding(){
    int i;
    float x = 0;
    float y;
    scen.front.offscreen.beginShape();
    scen.front.offscreen.fill(this.buildingColor);
    scen.front.offscreen.noStroke();
    scen.front.offscreen.vertex(0, scen.getHeight());
    for(i = 0;i < this.frontBuildingHeight.size();i++){
      y = this.frontBuildingHeight.get(i);
      scen.front.offscreen.vertex(x, y);
      scen.front.offscreen.vertex(x+this.buildingWidth, y);
      x += this.buildingWidth;
    }
    scen.front.offscreen.vertex(scen.getFrontWidth(), scen.getHeight());
    scen.front.offscreen.endShape();
  }
  void displayFrontBuildingWindow(){
    int i;
    scen.front.offscreen.fill(this.buildinWindowColor);
    for(i = 0;i < this.frontBuildingWindowY.size();i++){
      scen.front.offscreen.rect(this.frontBuildingWindowX.get(i),this.frontBuildingWindowY.get(i),this.buildingWindowSize,this.buildingWindowSize);
    }
  }
  void displayRight(){
    this.displayRightBuilding();
    this.displayRightBuildingWindow();
  }
  void displayRightBuilding(){
    int i;
    float y;
    float x;
    x = 0;
    scen.right.offscreen.beginShape();
    scen.right.offscreen.fill(this.buildingColor);
    scen.right.offscreen.noStroke();
    scen.right.offscreen.vertex(0, scen.getHeight());
    for(i = 0;i < this.rightBuildingHeight.size();i++){
      y = this.rightBuildingHeight.get(i);
      scen.right.offscreen.vertex(x, y);
      scen.right.offscreen.vertex(x+this.buildingWidth, y);
      x += this.buildingWidth;
    }
    scen.right.offscreen.vertex(scen.getSideWidth(), scen.getHeight());
    scen.right.offscreen.endShape();
  }
  void displayRightBuildingWindow(){
    int i;
    scen.right.offscreen.fill(this.buildinWindowColor);
    for(i = 0;i < this.rightBuildingWindowY.size();i++){
      scen.right.offscreen.rect(this.rightBuildingWindowX.get(i),this.rightBuildingWindowY.get(i),this.buildingWindowSize,this.buildingWindowSize);
    }
  }
  void displayLeft(){
    this.displayLeftBuilding();
    this.displayLeftBuildingWindow();
  }
  void displayLeftBuilding(){
    int i;
    float y;
    float x;
    x = 0;
    scen.left.offscreen.beginShape();
    scen.left.offscreen.fill(this.buildingColor);
    scen.left.offscreen.noStroke();
    scen.left.offscreen.vertex(scen.getSideWidth(), scen.getHeight());
    for(i = 0;i < this.leftBuildingHeight.size();i++){
      y = this.leftBuildingHeight.get(i);
      scen.left.offscreen.vertex(scen.getSideWidth()-i*this.buildingWidth,y);
      scen.left.offscreen.vertex(scen.getSideWidth()-i*this.buildingWidth-this.buildingWidth,y);
    }
    scen.left.offscreen.vertex(0, scen.getHeight());
    scen.left.offscreen.endShape();
  }
  void displayLeftBuildingWindow(){
    int i;
    scen.left.offscreen.fill(this.buildinWindowColor);
    for(i = 0;i < this.leftBuildingWindowX.size();i++){
      scen.left.offscreen.rect(this.leftBuildingWindowX.get(i),this.leftBuildingWindowY.get(i),this.buildingWindowSize,this.buildingWindowSize);
    }
  }
  void display(){
    scen.beginFrontDraw();
    this.displayFront();
    scen.endFrontDraw();
    scen.beginRightDraw();
    this.displayRight();
    scen.endRightDraw();
    scen.beginLeftDraw();
    this.displayLeft();
    scen.endLeftDraw();
  }
  void run(){
    this.display();
  }
}
