  class Night{
  float moonX;
  float moonY;
  float moonSize;
  color moonColor;
  float starX;
  float starY;
  float starSize;
  color starColor;
  color backColor;
  float backRate = 0;
  boolean brokenFlg = false;
  ArrayList<Float> brokenStarRings = new ArrayList<Float>();
  ArrayList<StarDust> dust = new ArrayList<StarDust>();
  int ringCount = 3;
  int dustCount = 80;
  Night(){
    int i;
    this.starX = scen.getFrontWidth()/2;
    this.starY = scen.getHeight()*0.2;
    this.starColor = color(0,255,0);
    this.starSize = scen.getHeight()*0.1;
    this.moonX = scen.getFrontWidth()*0.8;
    this.moonY = this.starY;
    this.moonColor = color(255,255,0);
    this.moonSize = scen.getHeight()*0.15;
    for(i = 0;i < this.ringCount;i++){
      //this.brokenStarRings.add(-i*800*scen.getRate());
      this.brokenStarRings.add(-i*(50*this.moonSize/(5*this.ringCount)));
    }
    for(i = 0;i < this.dustCount;i++){
      this.dust.add(new StarDust(new PVector(this.starX,this.starY)));
    }
    this.brokenFlg = false;
    this.backColor = this.starColor;
    this.backRate = 0;
  }
  void goBroken(){
    this.brokenFlg = true;
  }
  void display(){
    scen.backgroundAll(color(0));
    scen.beginFrontDraw();
    this.displayFrontStar();
    this.displayMoon();
    scen.endFrontDraw();
    scen.beginLeftDraw();
    this.displayLeftStar();
    scen.endLeftDraw();
    scen.beginRightDraw();
    this.displayRightStar();
    scen.endRightDraw();
  }
  void displayMoon(){
    scen.front.offscreen.noStroke();
    scen.front.offscreen.fill(this.moonColor);
    scen.front.offscreen.ellipse(this.moonX, this.moonY, this.moonSize, this.moonSize);
  }
  void displayFrontStar(){
    scen.front.offscreen.noStroke();
    scen.front.offscreen.fill(this.starColor);
    scen.front.offscreen.ellipse(this.starX, this.starY, this.starSize, this.starSize);
    scen.front.offscreen.noFill();
    scen.front.offscreen.strokeWeight(5*scen.getRate());
    scen.front.offscreen.stroke(this.starColor);
    this.displayDust();
    this.displayFrontRing();
  }
  void displayLeftStar(){
    this.displayLeftRing();
  }
  void displayRightStar(){
    this.displayRightRing();
  }
  void displayDust(){
    int i;
    if(this.brokenFlg){
      for(i = 0;i < this.dustCount;i++) this.dust.get(i).run();
    }
  }
  void displayFrontRing(){
    int i;
    scen.front.offscreen.noFill();
    scen.front.offscreen.strokeWeight(8*scen.getRate());
    scen.front.offscreen.stroke(this.starColor);
    for(i = 0;i < this.ringCount-1;i++){
      if(this.brokenStarRings.get(i) > 0)
        scen.front.offscreen.ellipse(this.starX, this.starY, this.brokenStarRings.get(i), this.brokenStarRings.get(i));
    }
    if(this.brokenStarRings.get(this.ringCount-1) > 0){
      scen.front.offscreen.fill(this.starColor);
      scen.front.offscreen.noStroke();
      scen.front.offscreen.ellipse(this.starX, this.starY, this.brokenStarRings.get(this.ringCount-1), this.brokenStarRings.get(this.ringCount-1));
    }
  }
  void displayLeftRing(){
    int i;
    float w;
    float theta;
    scen.left.offscreen.noFill();
    scen.left.offscreen.strokeWeight(8*scen.getRate());
    scen.left.offscreen.stroke(this.starColor);
    for(i = 0;i < this.ringCount-1;i++){
      w = this.brokenStarRings.get(i);
      theta = acos(this.starX/w);
      scen.left.offscreen.arc(scen.getSideWidth()+this.starX,this.starY,w,w,PI-theta,PI+theta);
    }
    if(this.brokenStarRings.get(this.ringCount-1) > 0){
      scen.left.offscreen.fill(this.starColor);
      scen.left.offscreen.noStroke();
      w = this.brokenStarRings.get(i);
      theta = acos(this.starX/w);
      scen.left.offscreen.arc(scen.getSideWidth()+this.starX,this.starY,w,w,PI-theta,PI+theta,OPEN);
    }
  }
  void displayRightRing(){
    int i;
    float w;
    float x;
    float theta;
    x = scen.getFrontWidth()-this.starX;
    scen.right.offscreen.noFill();
    scen.right.offscreen.strokeWeight(8*scen.getRate());
    scen.right.offscreen.stroke(this.starColor);
    for(i = 0;i < this.ringCount-1;i++){
      w = this.brokenStarRings.get(i);
      theta = acos(x/w);
      scen.right.offscreen.arc(-x,this.starY,w,w,-theta,theta);
    }
    if(this.brokenStarRings.get(this.ringCount-1) > 0){
      scen.right.offscreen.fill(this.starColor);
      scen.right.offscreen.noStroke();
      w = this.brokenStarRings.get(this.ringCount-1);
      theta = acos(x/w);
      scen.right.offscreen.arc(-x,this.starY,w,w,-theta,theta);
    }
  }
  void rogicSmallingStar(){
    if(this.starSize >= 0) this.starSize -= 5*scen.getRate();
  }
  void roicGrowStarRings(){
    int i;
    float tmp;
    for(i = 0;i < this.ringCount;i++){
      tmp = this.brokenStarRings.get(i);
      this.brokenStarRings.set(i,tmp+50*scen.getRate());
    }
  }
  void run(){
    this.display();
    if(this.brokenFlg){
      this.rogicSmallingStar();
      this.roicGrowStarRings();
    }
  }
  void changeNormal(){
    if(this.backColor <= 100) this.backRate++;
    scen.backgroundAll(lerpColor(this.backColor, BACKGROUND_BLACK, this.backRate/100));
    scen.beginFrontDraw();
    this.displayMoon();
    scen.endFrontDraw();
  }
}

class StarDust{
  PVector pos;
  PVector spd;
  PVector originalPos;
  float rate;
  float th;
  StarDust(PVector p){
    this.originalPos = p;
    this.init();
  }
  void init(){
    this.pos = new PVector(this.originalPos.x,this.originalPos.y);
    this.spd = new PVector(random(-5, 5)*scen.getRate(),random(-5, 5)*scen.getRate());
    this.th = random(0.001,0.1);
    this.rate = random(1,250)*scen.getRate();
  }
  void display(){
    scen.front.offscreen.rect(0,0,200*scen.getRate(),200*scen.getRate());
  }
  void rogic(){
    this.rate -= 1*scen.getRate();
    this.th += this.th;
    this.pos.add(this.spd);
  }
  void setMatrix(){
    scen.front.offscreen.translate(this.pos.x, this.pos.y);
    scen.front.offscreen.rotate(this.th*PI);
  }
  void run(){
    if(0 < this.rate){
      this.rogic();
      scen.front.offscreen.pushMatrix();
      this.setMatrix();
      this.display();
      scen.front.offscreen.popMatrix();
    }else{
      this.init();
    }
  }
}
