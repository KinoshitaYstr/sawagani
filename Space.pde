class Space{
  ArrayList<Star> stars;
  float range;
  float updateRange;
  Space(){
    this.stars = new ArrayList<Star>();
    this.range = 0;
    this.updateRange = 20;
  }
  void createStar(float min,float max){
    this.stars.add(new Star(min,max));
  }
  void draw(){
    int i;
    for(i = 0;i < this.stars.size();i++) this.stars.get(i).draw();
  }
  void setUpdateRange(float r){
    this.updateRange = r;
  }
  void next(int size){
    int i;
    if(this.range < scen.getAllWidth()/2)
      for(i = 0;i < size;i++)
        this.createStar(this.range,this.range+this.updateRange);
    else
      for(i = 0;i < size;i++)
        this.createStar(0,scen.getAllWidth()/2);
    this.range += this.updateRange;
  }
}

class Star{
  float size;
  float x;
  float y;
  color c;
  int type; //left -> -1,front -> 0,right -> 1
  Star(float min,float max){
    this.init(min,max);
  }
  void init(float min,float max){
    float r;
    float th;
    float halfWidth;
    float halfHeight;
    halfWidth = scen.getAllWidth()/2;
    halfHeight = scen.getHeight()/2;
    this.size = random(1, 10);
    this.c = color(random(0, 255),random(0, 255),random(0, 255));
    do{
      r = random(min, max);
      th = random(-1, 1);
      this.x = r*cos(PI*th);
      this.y = r*sin(PI*th);
    }while(abs(this.y) >= halfHeight || abs(this.x) >= halfWidth);
    this.y = halfHeight+this.y;
    this.x = halfWidth+this.x;
    if(0 <= this.x && this.x <= scen.getSideWidth()){
      this.type = -1;
    }else if(scen.getSideWidth() < this.x && this.x < scen.getSideWidth()+scen.getFrontWidth()){
      this.type = 0;
      this.x = this.x-scen.getSideWidth();
    }else{
      this.type = 1;
      this.x = this.x-scen.getSideWidth()-scen.getFrontWidth();
    }
  }

  void draw(){
    if(this.type == -1){
      scen.beginLeftDraw();
      scen.left.offscreen.noStroke();
      scen.left.offscreen.fill(color(this.c));
      scen.left.offscreen.ellipse(this.x, this.y, this.size, this.size);
      scen.endLeftDraw();
    }else if(this.type == 1){
      scen.beginRightDraw();
      scen.right.offscreen.noStroke();
      scen.right.offscreen.fill(color(this.c));
      scen.right.offscreen.ellipse(this.x, this.y, this.size, this.size);
      scen.endRightDraw();
    }else{
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(color(this.c));
      scen.front.offscreen.ellipse(this.x, this.y, this.size, this.size);
      scen.endFrontDraw();
    }
  }
}
