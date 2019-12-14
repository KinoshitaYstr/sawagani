class Rain{
  PShape img;
  ArrayList<PVector> pos = new ArrayList<PVector>();
  ArrayList<PVector> spd = new ArrayList<PVector>();
  ArrayList<Float> size = new ArrayList<Float>();
  ArrayList<Integer> c = new ArrayList<Integer>();
  String path;
  float th;
  Rain(){
    this.th = 0;
  }
  void setPath(String p){
    this.path = p;
  }
  void loadSVG(){
    this.img = loadShape(this.path);
    this.img.disableStyle();
  }
  void create(int size){
    int i;
    for(i = 0;i < size;i++) add();
  }
  void add(){
    this.addPos();
    this.addSpd();
    this.addColor();
    this.addSize();
  }
  void addPos(){
    this.pos.add(new PVector(random(0,scen.getAllWidth()),-random(scen.getHeight()/2,scen.getHeight())));
  }
  void addSpd(){
    this.spd.add(new PVector(0,random(100,200)*scen.getRate()));
  }
  void addColor(){
    this.c.add(color(random(0,84),random(0,195),random(200,241)));
  }
  void addSize(){
    this.size.add(random(100,300)*scen.getRate());
  }
  void display(){
    int i;
    for(i = 0;i < this.pos.size();i++){
      if(0 <= this.pos.get(i).x && this.pos.get(i).x < scen.getSideWidth()){
        scen.beginLeftDraw();
        scen.left.offscreen.fill(this.c.get(i));
        scen.left.offscreen.noStroke();
        scen.left.offscreen.shape(this.img,this.pos.get(i).x,this.pos.get(i).y,this.size.get(i),3*this.size.get(i));
        scen.endLeftDraw();
        if(scen.getSideWidth() < this.pos.get(i).x+this.size.get(i)+3*this.size.get(i)){
          scen.beginFrontDraw();
          scen.front.offscreen.fill(this.c.get(i));
          scen.front.offscreen.noStroke();
          scen.front.offscreen.shape(this.img,this.pos.get(i).x-scen.getSideWidth(),this.pos.get(i).y,this.size.get(i),3*this.size.get(i));
          scen.endFrontDraw();
        }
      }else if(scen.getSideWidth() <= this.pos.get(i).x && this.pos.get(i).x <= scen.getSideWidth()+scen.getFrontWidth()){
        scen.beginFrontDraw();
        scen.front.offscreen.fill(this.c.get(i));
        scen.front.offscreen.noStroke();
        scen.front.offscreen.shape(this.img,this.pos.get(i).x-scen.getSideWidth(),this.pos.get(i).y,this.size.get(i),3*this.size.get(i));
        scen.endFrontDraw();
        if(scen.getSideWidth()+scen.getFrontWidth() < this.pos.get(i).x+this.size.get(i)+3*this.size.get(i)){
          scen.beginRightDraw();
          scen.right.offscreen.fill(this.c.get(i));
          scen.right.offscreen.noStroke();
          scen.right.offscreen.shape(this.img,this.pos.get(i).x-(scen.getSideWidth()+scen.getFrontWidth()),this.pos.get(i).y,this.size.get(i),3*this.size.get(i));
          scen.endRightDraw();
        }
      }else{
        scen.beginRightDraw();
        scen.right.offscreen.fill(this.c.get(i));
        scen.right.offscreen.noStroke();
        scen.right.offscreen.shape(this.img,this.pos.get(i).x-(scen.getSideWidth()+scen.getFrontWidth()),this.pos.get(i).y,this.size.get(i),3*this.size.get(i));
        scen.endRightDraw();
      }
    }
  }
  void rogic(){
    int i;
    for(i = 0;i < this.pos.size();i++){
      this.pos.get(i).add(this.spd.get(i));
      if(this.pos.get(i).y > scen.getHeight()) this.pos.set(i,new PVector(random(-scen.getHeight()*tan(-this.th),scen.getAllWidth()-scen.getHeight()*tan(-this.th)),random(-scen.getHeight()/2,0)));
    }
  }
  void run(){
    this.rogic();
    this.display();
  }
  void updateSpd(float min,float max){
    int i;
    float tmp;
    tmp = scen.getRate()*random(min,max);
    //for(i = 0;i < this.spd.size();i++) this.spd.set(i,new PVector(tmp*cos(this.th),tmp*sin(this.th)));
    for(i = 0;i < this.spd.size();i++) this.spd.set(i,new PVector(-tmp*sin(this.th),tmp*cos(this.th)));
  }
  void initColor(){
    int i;
    for(i = 0;i < this.c.size();i++){
      this.c.set(i,color(random(0,84),random(0,195),random(200,241)));
    }
  }
  void initSimpleColor(color c){
    int i;
    for(i = 0;i < this.c.size();i++){
      this.c.set(i,c);
    }
  }
  void updateTheta(float t,float min,float max){
    this.th = -t*PI/180;
    this.updateSpd(min,max);
     this.img.rotateX(-t*PI/180);
    //this.img.rotate(-t*PI/180,0.0,0.0,1.0);
  }
  void changeColor(color c){
    int i;
    for(i = 0;i < this.c.size();i++){
      this.c.set(i,c);
    }
  }
}
