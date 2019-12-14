import deadpixel.keystone.*;

class SurfaceBase{
  CornerPinSurface surface;
  PGraphics offscreen;

  SurfaceBase(float w,float h){
    this.surface = ks.createCornerPinSurface(int(w), int(h), 100);
    this.offscreen = createGraphics(int(w), int(h), P3D);
  }

  void beginDraw(){
    this.offscreen.beginDraw();
  }

  void endDraw(){
    this.offscreen.endDraw();
  }

  void draw(){
    this.beginDraw();
    this.endDraw();
  }

  void render(){
    this.surface.render(offscreen);
  }

  void separateTwoBackgroundColor(color l,color r,float sepRate){
    this.beginDraw();
    this.offscreen.background(r);
    this.offscreen.noStroke();
    this.offscreen.fill(l);
    this.offscreen.rect(0.0,0.0,this.offscreen.width*sepRate,this.offscreen.height);
    this.endDraw();
  }
}
