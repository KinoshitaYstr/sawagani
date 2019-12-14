import deadpixel.keystone.*;

class Scen{
  SurfaceBase left;
  SurfaceBase front;
  SurfaceBase right;
  private float frontHeight = 4000;
  private float frontWidth = 3330;
  private float sideHeight = 4000;
  private float sideWidth = 1830;
  private float rate = 0.1;
  Scen(){
    this.left = new SurfaceBase(this.rate*this.sideWidth,this.rate*this.sideHeight);
    this.front = new SurfaceBase(this.rate*this.frontWidth,this.rate*this.frontHeight);
    this.right = new SurfaceBase(this.rate*this.sideWidth,this.rate*this.sideHeight);
  }

  void backgroundAll(color c){
    this.beginLeftDraw();
    this.left.offscreen.background(c);
    this.endLeftDraw();
    this.beginFrontDraw();
    this.front.offscreen.background(c);
    this.endFrontDraw();
    this.beginRightDraw();
    this.right.offscreen.background(c);
    this.endRightDraw();
  }

  void backgroundSide(color c){
    this.beginLeftDraw();
    this.left.offscreen.background(c);
    this.endLeftDraw();
    this.beginRightDraw();
    this.right.offscreen.background(c);
    this.endRightDraw();
  }

  void backgroundFront(color c){
    this.beginFrontDraw();
    this.front.offscreen.background(c);
    this.endFrontDraw();
  }

  void onLeftLight(){
    this.beginLeftDraw();
    this.left.offscreen.background(color(255));
    this.endLeftDraw();
    this.beginFrontDraw();
    this.front.separateTwoBackgroundColor(color(255),color(0),0.5);
    this.endFrontDraw();
    this.beginRightDraw();
    this.right.offscreen.background(color(0));
    this.endRightDraw();
  }

  void onRightLight(){
    this.beginLeftDraw();
    this.left.offscreen.background(color(0));
    this.endLeftDraw();
    this.beginFrontDraw();
    this.front.separateTwoBackgroundColor(color(0),color(255),0.5);
    this.endFrontDraw();
    this.beginRightDraw();
    this.right.offscreen.background(color(255));
    this.endRightDraw();
  }

  float getAllWidth(){
    return this.rate*(this.frontWidth+this.sideWidth*2);
  }

  float getHeight(){
    return this.rate*this.frontHeight;
  }

  float getFrontWidth(){
    return this.rate*this.frontWidth;
  }

  float getSideWidth(){
    return this.rate*this.sideWidth;
  }

  float getRate(){
    return this.rate;
  }

  void setRate(float r){
    this.rate = r;
  }

  void beginAllDraw(){
    this.left.beginDraw();
    this.front.beginDraw();
    this.right.beginDraw();
  }

  void beginLeftDraw(){
    this.left.beginDraw();
  }

  void beginFrontDraw(){
    this.front.beginDraw();
  }

  void beginRightDraw(){
    this.right.beginDraw();
  }

  void endAllDraw(){
    this.left.endDraw();
    this.front.endDraw();
    this.right.endDraw();
  }

  void endLeftDraw(){
    this.left.endDraw();
  }

  void endFrontDraw(){
    this.front.endDraw();
  }

  void endRightDraw(){
    this.right.endDraw();
  }

  void draw(){
    this.beginAllDraw();
    this.endAllDraw();
  }

  void render(){
    this.left.render();
    this.front.render();
    this.right.render();
  }

  void createShadow(){
    this.createLeftShadow();
    this.createRightShadow();
  }

  private void createLeftShadow(){
    this.beginLeftDraw();
    this.left.offscreen.fill(BACKGROUND_BLACK);
    //this.left.offscreen.fill(color(255,0,0));
    this.left.offscreen.noStroke();
    this.left.offscreen.beginShape();
    this.left.offscreen.vertex(0,1567.05*this.rate);
    this.left.offscreen.vertex(183.50*this.rate,1249.22*this.rate);
    this.left.offscreen.vertex(302.28*this.rate,1332.39*this.rate);
    this.left.offscreen.vertex(357.01*this.rate,1275.34*this.rate);
    this.left.offscreen.vertex(442.05*this.rate,1064.87*this.rate);
    this.left.offscreen.vertex(715.36*this.rate,979.58*this.rate);
    this.left.offscreen.vertex(848.25*this.rate,871.97*this.rate);
    this.left.offscreen.vertex(966.34*this.rate,508.67*this.rate);
    this.left.offscreen.vertex(1211.19*this.rate,500.12*this.rate);
    this.left.offscreen.vertex(1311*this.rate,192.93*this.rate);
    this.left.offscreen.vertex(1551.52*this.rate,59.61*this.rate);
    this.left.offscreen.vertex(this.getSideWidth(),0);
    this.left.offscreen.vertex(0,0);
    this.left.offscreen.endShape();
    this.endLeftDraw();
  }

  private void createRightShadow(){
    this.beginRightDraw();
    this.right.offscreen.fill(BACKGROUND_BLACK);
    //this.right.offscreen.fill(color(255,0,0));
    this.right.offscreen.noStroke();
    this.right.offscreen.beginShape();
    this.right.offscreen.vertex(0, 0);
    this.right.offscreen.vertex(279.82*this.rate,9.77*this.rate);
    this.right.offscreen.vertex(382.22*this.rate,326.47*this.rate);
    this.right.offscreen.vertex(612.18*this.rate,322.46*this.rate);
    this.right.offscreen.vertex(889.43*this.rate,476.14*this.rate);
    this.right.offscreen.vertex(1001.75*this.rate,802.34*this.rate);
    this.right.offscreen.vertex(1248.92*this.rate,922.89*this.rate);
    this.right.offscreen.vertex(1546*this.rate,744.17*this.rate);
    this.right.offscreen.vertex(1655.4*this.rate,905.83*this.rate);
    this.right.offscreen.vertex(this.getSideWidth(),996.57*this.rate);
    this.right.offscreen.vertex(this.getSideWidth(),0);
    this.right.offscreen.endShape();
    this.endRightDraw();
  }
}
