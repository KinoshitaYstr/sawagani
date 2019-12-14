class Speaker{
  int type;
  float height;
  float triangleLength;
  float pos;
  Speaker(){
    float x;
    x = random(0, scen.getAllWidth());
    if(0 <= x && x < scen.getSideWidth()){
      this.type = -1;
    }else if(scen.getSideWidth() <= x && x < scen.getSideWidth()+scen.getFrontWidth()){
      this.type = 0;
      x = x-scen.getSideWidth();
    }else{
      this.type = 1;
      x = x-scen.getSideWidth()-scen.getFrontWidth();
    }
    this.height = random(scen.getHeight()*0.2,scen.getHeight()*0.4);
    this.triangleLength = random(this.height*0.1,this.height*0.2);
    if(this.type == 0){
      this.pos = random(0,scen.getFrontWidth());
    }else{
      this.pos = random(0,scen.getSideWidth());
    }
  }
  void display(){
    switch (this.type) {
      case -1:
        scen.beginLeftDraw();
        scen.left.offscreen.strokeWeight(3);
        scen.left.offscreen.stroke(color(0));
        scen.left.offscreen.fill(color(0));
        scen.left.offscreen.line(this.pos,scen.getHeight(),this.pos,scen.getHeight()-this.height);
        scen.left.offscreen.triangle(this.pos,scen.getHeight()-this.height,this.pos+this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height+this.triangleLength/2,this.pos+this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height-this.triangleLength/2);
        scen.left.offscreen.triangle(this.pos,scen.getHeight()-this.height,this.pos-this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height+this.triangleLength/2,this.pos-this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height-this.triangleLength/2);
        scen.endLeftDraw();
        break;
      case 0:
        scen.beginFrontDraw();
        scen.front.offscreen.strokeWeight(3);
        scen.front.offscreen.stroke(color(0));
        scen.front.offscreen.fill(color(0));
        scen.front.offscreen.line(this.pos,scen.getHeight(),this.pos,scen.getHeight()-this.height);
        scen.front.offscreen.triangle(this.pos,scen.getHeight()-this.height,this.pos+this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height+this.triangleLength/2,this.pos+this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height-this.triangleLength/2);
        scen.front.offscreen.triangle(this.pos,scen.getHeight()-this.height,this.pos-this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height+this.triangleLength/2,this.pos-this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height-this.triangleLength/2);
        scen.endFrontDraw();
        break;
      case 1:
        scen.beginRightDraw();
        scen.right.offscreen.strokeWeight(3);
        scen.right.offscreen.stroke(color(0));
        scen.right.offscreen.fill(color(0));
        scen.right.offscreen.line(this.pos,scen.getHeight(),this.pos,scen.getHeight()-this.height);
        scen.right.offscreen.triangle(this.pos,scen.getHeight()-this.height,this.pos+this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height+this.triangleLength/2,this.pos+this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height-this.triangleLength/2);
        scen.right.offscreen.triangle(this.pos,scen.getHeight()-this.height,this.pos-this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height+this.triangleLength/2,this.pos-this.triangleLength*sqrt(3)/2,scen.getHeight()-this.height-this.triangleLength/2);
        scen.endRightDraw();
        break;
    }
  }
}
