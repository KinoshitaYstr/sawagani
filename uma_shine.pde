import deadpixel.keystone.*;

final float RATE = 0.1;
final int SPACE_UPDATE_SIZE = 100;
final float BIG_CHAR_SIZE = 500*RATE;
//final float NORMAL_CHAR_SIZE = 200*RATE;
final float NORMAL_CHAR_SIZE = 300*RATE;
final float WHO_CHAR_SIZE = 300*RATE;
final float QUESTION_CHAR_SIZE = 300*RATE;
final float RADIO_CHAR_SIZE = NORMAL_CHAR_SIZE;
final float OLDMAN_CHAR_SIZE = 500*RATE;
final float OLDMAN_SIZE_2 = random(300,400)*RATE;
final float OLDMAN_SIZE_3 = random(300,400)*RATE;
final float OLDMAN_SIZE_4 = random(300,400)*RATE;
final float OLDMAN_SIZE_5 = random(300,400)*RATE;
final float MISA_CHAR_SIZE = 600*RATE;
final float SMARTPHONE_CHAR_SIZE = 150*RATE;
final float TV_CHAR_SIZE = 270*RATE;
final float DOG_CHAR_SIZE = NORMAL_CHAR_SIZE*1.2;
final float CAT_CHAR_SIZE = NORMAL_CHAR_SIZE;
final float MICKY_CHAR_SIZE = 0.8*NORMAL_CHAR_SIZE;
final float MONKEY_CHAR_SIZE = NORMAL_CHAR_SIZE;
final float STRING_TOP_MAX = 4000/3*RATE;
final float QUESTION_STRING_TOP_MAX = 4000/5*RATE;
final color CHAR_BLACK = color(0);
final color CHAR_WHITE = color(255);
final color BACKGROUND_BLACK = color(0);
final color BACKGROUND_WHITE = color(255);
final color BACKGROUND_LIME = color(0,255,0);
final color BACKGROUND_DARKGREEN = color(0,100,0);
final color BACKGROUND_YELLOW = color(255,255,0);
final color BACKGROUND_YELLOW_V2 = color(255,255,128);
final color BACKGROUND_WATER = color(0,191,255);
final color BACKGROUND_PINK = color(255,0,255);
final color BACKGROUND_PINK_V2 = color(255,0,128);
final color BACKGROUND_ORANGE = color(246,109,60);
final color BACKGROUND_RED = color(255,0,0);
final color BACKGROUND_NAVY = color(0,0,128);
final color BACKGROUND_SKY = color(160,216,239);
final color SMARTPHONE_BLACK = color(0);
final color SMARTPHONE_BLUE = color(0,0,255);
final color SMARTPHONE_BROWN = color(100);
final color SMARTPHONE_RING = color(255);
final color RADIO_GRAY = color(100);
final color RADIO_WHITE = color(255);
final color RADIO_BLACK = color(0);
final color RADIO_RED = color(255,0,0);
final color RADIO_YELLOW = color(255,255,0);
final color TV_BKACK = color(0);
final color TV_BLUE = color(0,0,255);
final color TV_YELLOW = color(255,255,0);
final color VARIETY_A = color(239,102,65);
final color VARIETY_B = color(255,246,127);
final color OLDMAN_BACK_1 = color(0,255,255);
final color OLDMAN_BACK_2 = color(0,128,128);
final color OLDMAN_BACK_3 = color(255,140,0);
final color OLDMAN_BACK_4 = color(255,0,255);
final color OLDMAN_BACK_5 = color(255,71,88);
final color OLDMAN_BACK_6 = color(152,233,235);
final color OLDMAN_BACK_7_PURPLE = color(208,0,219);
final color QUESTION_BAR_BLACK = color(0);
final color QUESTION_BACK_WHITE = color(255);
final color WATER_1 = color(0,0,255);
final color WATER_2 = color(0,0,170);
final color ROAD_GRAY = color(150);
final color ROAD_SIDE_WHITE = color(255);
final color NORMAL_TOWN = color(210,180,140);
final color BUILDING_COLOR = color(102,205,170);
final color TRUCK_BLUE = color(0,0,255);
final color TRUCK_BASE_WHITE = color(200);
final color TRUCK_BLACK = color(0);
final color TRUCK_LIGHT = color(255,243,63);
final color TANK_MAIN_GREEN = color(32,178,170);
final color TANK_BLACK = color(50);
final color RUN_AWAY_YELLOW = color(255,215,0);
final String STRING_DATA_PATH = "string_svg";

int p; //part number
Scen scen;
Keystone ks;
Space space;
Rain rain;
Night night;
Town town;
StarForTV starTV;
PShape sky;
float greenRate;
ArrayList<Speaker> speaker = new ArrayList<Speaker>();
float truckSize;
float tankSize;
PImage starBack2;

void setup(){
  fullScreen(P3D);
  init();
  //p = 82;
  sky = loadShape("back_svg/sky.svg");
  starBack2 = loadImage("img/sky2.jpg");
}

void draw(){
  println("p: "+p);
  background(BACKGROUND_BLACK);
  partFunc(p);
  scen.createShadow();
  scen.render();
}

void keyPressed() {
  switch(key) {
    case 'n':
      p++;
      update();
      break;
    case 'c':
      ks.toggleCalibration();
      break;
    case 'l':
      ks.load();
      break;
    case 's':
      ks.save();
      break;
    case 'b':
      p--;
      break;
  }
}

void init(){
  println("init");
  int i;
  p = 0;
  background(color(255));
  ks = new Keystone(this);
  scen = new Scen();
  //scen.setRate(RATE);
  space = new Space();
  rain = new Rain();
  rain.setPath("string_svg/ザアア.svg");
  rain.loadSVG();
  rain.create(30);
  night = new Night();
  town = new Town();
  starTV = new StarForTV();
  greenRate = 0;
  for(i = 0;i < 10;i++){
    speaker.add(new Speaker());
  }
  truckSize = 1300;
  tankSize = 1300;
  space.setUpdateRange(scen.getAllWidth()*RATE/4);
}

void update(){
  switch (p) {
    case 2:
    case 4:
    case 6:
    case 8:
    case 10:
    case 12:
      space.next(SPACE_UPDATE_SIZE);
      break;
    case 31:
      night.goBroken();
      break;
    case 83:
      rain.updateTheta(-30,200,300);
      //rain.updateSpd(200,500);
      break;
    //case 122:
    case 180:
      rain.changeColor(color(255));
      break;
  }
}

void partFunc(int p){
  int i;
  switch (p) {
    case 0:
      scen.backgroundAll(BACKGROUND_BLACK);
      break;
    case 1:
      scen.backgroundAll(BACKGROUND_BLACK);
      // セリフ
      break;
    case 2:
      scen.backgroundAll(BACKGROUND_BLACK);
      space.draw();
      break;
    case 3:
      scen.backgroundAll(BACKGROUND_BLACK);
      // セリフ
      break;
    case 4:
      scen.backgroundAll(BACKGROUND_BLACK);
      space.draw();
      break;
    case 5:
      scen.backgroundAll(BACKGROUND_BLACK);
      // セリフ
      break;
    case 6:
      scen.backgroundAll(BACKGROUND_BLACK);
      space.draw();
      break;
    case 7:
      scen.backgroundAll(BACKGROUND_BLACK);
      // セリフ
      break;
    case 8:
      scen.backgroundAll(BACKGROUND_BLACK);
      space.draw();
      break;
    case 9:
      scen.backgroundAll(BACKGROUND_BLACK);
      // セリフ
      break;
    case 10:
      scen.backgroundAll(BACKGROUND_BLACK);
      space.draw();
      break;
    case 11:
      scen.backgroundAll(BACKGROUND_BLACK);
      // セリフ
      break;
    case 12:
      scen.backgroundAll(BACKGROUND_BLACK);
      space.draw();
      break;
    case 13:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 14:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("101",NORMAL_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()-4*NORMAL_CHAR_SIZE,STRING_TOP_MAX);
      break;
    case 15:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("102",NORMAL_CHAR_SIZE,CHAR_BLACK,0,STRING_TOP_MAX);
      break;
    case 16:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("201",NORMAL_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()-4*NORMAL_CHAR_SIZE,STRING_TOP_MAX);
      displayFrontUnderOldMan(OLDMAN_CHAR_SIZE,scen.getFrontWidth()-1.2*BIG_CHAR_SIZE);
      break;
    case 17:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("202",NORMAL_CHAR_SIZE,CHAR_BLACK,0,STRING_TOP_MAX);
      break;
    case 18:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontUnderOldMan(OLDMAN_CHAR_SIZE,scen.getFrontWidth()/2);
      break;
    case 19:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 20:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontUnderOldMan(OLDMAN_CHAR_SIZE,scen.getFrontWidth()-1.2*BIG_CHAR_SIZE);
      break;
    case 21:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 22:
      night.run();
      break;
    case 23:
      scen.backgroundAll(BACKGROUND_WHITE);
      displaySmartPhone(SMARTPHONE_BLUE);
      // セリフ
      // セリフ
      break;
    case 24:
      scen.onLeftLight();
      break;
    case 25:
      scen.onRightLight();
      break;
    case 26:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayTV(TV_BLUE);
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      break;
    case 27:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayVarietyTV();
      break;
    case 28:
      scen.onRightLight();
      break;
    case 29:
      scen.onLeftLight();
      break;
    case 30:
      night.run();
      break;
    case 31:
      night.run();
      break;
    case 32:
      night.changeNormal();
      break;
    case 33:
      scen.onRightLight();
      break;
    case 34:
      scen.onLeftLight();
      break;
    case 35:
      scen.backgroundAll(BACKGROUND_LIME);
      break;
    case 36:
      scen.onLeftLight();
      break;
    case 37:
      scen.backgroundAll(BACKGROUND_DARKGREEN);
      break;
    case 38:
      scen.beginLeftDraw();
      scen.left.offscreen.shape(sky,0,0,2*scen.getSideWidth()+scen.getFrontWidth(),scen.getHeight());
      scen.endLeftDraw();
      scen.beginFrontDraw();
      scen.front.offscreen.shape(sky,-scen.getSideWidth(),0,2*scen.getSideWidth()+scen.getFrontWidth(),scen.getHeight());
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.right.offscreen.shape(sky,-scen.getSideWidth()-scen.getFrontWidth(),0,2*scen.getSideWidth()+scen.getFrontWidth(),scen.getHeight());
      scen.endRightDraw();
      displayCenterStringSVG("朝朝朝",BIG_CHAR_SIZE,CHAR_BLACK,0);
      town.run();
      break;
    case 39:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      break;
    case 40:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayTV(TV_YELLOW);
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      break;
    case 41:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayTV(TV_BLUE);
      starTV.display();
      break;
    case 42:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayTV(lerpColor(TV_BLUE,color(0,255,0),greenRate/100));
      starTV.broken();
      starTV.displayMoon();
      starTV.displayBuilding();
      starTV.displayWindow();
      greenRate += 1;
      break;
    case 43:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayTV(TV_YELLOW);
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      break;
    case 44:
      scen.onRightLight();
      break;
    case 45:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      break;
    case 46:
      scen.onLeftLight();
      break;
    case 47:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      break;
    case 48:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayRightUnderOldMan(OLDMAN_CHAR_SIZE,0);
      break;
    case 49:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayRightUnderOldMan(OLDMAN_CHAR_SIZE,0);
      // セリフ
      break;
    case 50:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayRightUnderOldMan(OLDMAN_CHAR_SIZE,0);
      break;
    case 51:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayRightUnderOldMan(OLDMAN_CHAR_SIZE,0);
      // セリフ
      break;
    case 52:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayRightUnderOldMan(OLDMAN_CHAR_SIZE,0);
      break;
    case 53:
      scen.onRightLight();
      break;
    case 54:
      scen.onLeftLight();
      break;
    case 55:
      displayAlert();
      break;
    case 56:
      scen.onLeftLight();
      break;
    case 57:
      scen.onRightLight();
      break;
    case 58:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(OLDMAN_BACK_1);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2*OLDMAN_CHAR_SIZE+OLDMAN_CHAR_SIZE/2,OLDMAN_CHAR_SIZE*0.2+OLDMAN_CHAR_SIZE,OLDMAN_CHAR_SIZE*2.2,OLDMAN_CHAR_SIZE*2.2);
      scen.endFrontDraw();
      displayFrontOldMan(OLDMAN_CHAR_SIZE,scen.getFrontWidth()-2*OLDMAN_CHAR_SIZE,OLDMAN_CHAR_SIZE*0.1);
      break;
    case 59:
      scen.onLeftLight();
      break;
    case 60:
      scen.onRightLight();
      break;
    case 61:
      scen.backgroundAll(BACKGROUND_WHITE);
      displaySmartPhone(SMARTPHONE_BLUE);
      // セリフ
      // セリフ
      break;
    case 62:
      scen.onRightLight();
      break;
    case 63:
      displayAlert();
      break;
    case 64:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      // セリフ
      break;
    case 65:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 66:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 67:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 68:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 69:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginLeftDraw();
      scen.left.offscreen.strokeWeight(2);
      scen.left.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.left.offscreen.noFill();
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.endLeftDraw();
      scen.beginFrontDraw();
      scen.front.offscreen.strokeWeight(2);
      scen.front.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.front.offscreen.noFill();
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE);
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.right.offscreen.strokeWeight(2);
      scen.right.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.right.offscreen.noFill();
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.endRightDraw();
      // セリフ
      // セリフ
      break;
    case 70:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginLeftDraw();
      scen.left.offscreen.strokeWeight(2);
      scen.left.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.left.offscreen.noFill();
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.endLeftDraw();
      scen.beginFrontDraw();
      scen.front.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.front.offscreen.noFill();
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+6.7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+6.7*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+8.2*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+8.2*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+9.7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+9.7*QUESTION_CHAR_SIZE);      
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.front.offscreen.strokeWeight(2);
      scen.right.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.right.offscreen.noFill();
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.endRightDraw();
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      break;
    case 71:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginLeftDraw();
      scen.left.offscreen.strokeWeight(2);
      scen.left.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.left.offscreen.noFill();
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.endLeftDraw();
      scen.beginFrontDraw();
      scen.front.offscreen.strokeWeight(2);
      scen.front.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.front.offscreen.noFill();
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+6.7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+6.7*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+8.2*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+8.2*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+9.7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+9.7*QUESTION_CHAR_SIZE);      
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.right.offscreen.strokeWeight(2);
      scen.right.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.right.offscreen.noFill();
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.endRightDraw();
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      break;
    case 72:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginLeftDraw();
      scen.left.offscreen.strokeWeight(2);
      scen.left.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.left.offscreen.noFill();
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.endLeftDraw();
      scen.beginFrontDraw();
      scen.front.offscreen.strokeWeight(2);
      scen.front.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.front.offscreen.noFill();
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE);
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.right.offscreen.strokeWeight(2);
      scen.right.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.right.offscreen.noFill();
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.endRightDraw();
      // セリフ
      // セリフ
      break;
    case 73:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginLeftDraw();
      scen.left.offscreen.strokeWeight(2);
      scen.left.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.left.offscreen.noFill();
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.endLeftDraw();
      scen.beginFrontDraw();
      scen.front.offscreen.strokeWeight(2);
      scen.front.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.front.offscreen.noFill();
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+6.7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+6.7*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+8.2*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+8.2*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE);
      scen.front.offscreen.line(0,QUESTION_STRING_TOP_MAX+9.7*QUESTION_CHAR_SIZE,scen.getFrontWidth(),QUESTION_STRING_TOP_MAX+9.7*QUESTION_CHAR_SIZE);      
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.right.offscreen.strokeWeight(2);
      scen.right.offscreen.stroke(QUESTION_BAR_BLACK);
      scen.right.offscreen.noFill();
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+5.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+7*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX+8.5*QUESTION_CHAR_SIZE,4*QUESTION_CHAR_SIZE,1.2*QUESTION_CHAR_SIZE,50*RATE);
      scen.endRightDraw();
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      break;
    case 74:
      scen.backgroundAll(BACKGROUND_BLACK);
      scen.beginLeftDraw();
      scen.left.offscreen.noStroke();
      scen.left.offscreen.fill(QUESTION_BACK_WHITE);
      scen.left.offscreen.rect(3*QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.endLeftDraw();
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(QUESTION_BACK_WHITE);
      scen.front.offscreen.rect(0,QUESTION_STRING_TOP_MAX,scen.getFrontWidth(),5*QUESTION_CHAR_SIZE);
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.right.offscreen.strokeWeight(2);
      scen.right.offscreen.noStroke();
      scen.right.offscreen.fill(QUESTION_BACK_WHITE);
      scen.right.offscreen.rect(-QUESTION_CHAR_SIZE,QUESTION_STRING_TOP_MAX,4*QUESTION_CHAR_SIZE,5*QUESTION_CHAR_SIZE,50*RATE);
      scen.endRightDraw();
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      break;
    case 75:
      scen.onRightLight();
      break;
    case 76:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 77:
      scen.onLeftLight();
      break;
    case 78:
      scen.onLeftLight();
      // セリフ
      break;
    case 79:
      scen.onLeftLight();
      break;
    case 80:
      scen.onLeftLight();
      // セリフ
      break;
    case 81:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 82:
      scen.backgroundAll(BACKGROUND_DARKGREEN);
      break;
    case 83:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      break;
    case 84:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 85:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      // セリフ
      break;
    case 86:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 87:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 88:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 89:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 90:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 91:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 92:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 93:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 94:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 95:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 96:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 97:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      // セリフ
      // セリフ
      break;
    case 98:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      break;
    case 99:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 100:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 101:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 102:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 103:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      break;
    case 104:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 105:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 106:
      scen.backgroundAll(BACKGROUND_WHITE);
      rain.run();
      // セリフ
      break;
    case 107:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 108:
      scen.backgroundAll(BACKGROUND_BLACK);
      break;
    case 109:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 110:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 111:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(OLDMAN_BACK_2);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-1.1*OLDMAN_SIZE_2,1.1*OLDMAN_SIZE_2,2.2*OLDMAN_SIZE_2,2.2*OLDMAN_SIZE_2);
      scen.front.offscreen.fill(OLDMAN_BACK_3);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2.2*OLDMAN_SIZE_2-1.1*OLDMAN_SIZE_3,1.1*OLDMAN_SIZE_3,2.2*OLDMAN_SIZE_3,2.2*OLDMAN_SIZE_3);
      scen.front.offscreen.fill(OLDMAN_BACK_4);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2.2*(OLDMAN_SIZE_2+OLDMAN_SIZE_3)-1.1*OLDMAN_SIZE_4,1.1*OLDMAN_SIZE_4,2.2*OLDMAN_SIZE_4,2.2*OLDMAN_SIZE_4);
      scen.front.offscreen.fill(OLDMAN_BACK_5);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2.2*(OLDMAN_SIZE_2+OLDMAN_SIZE_3+OLDMAN_SIZE_4)-1.1*OLDMAN_SIZE_5,1.1*OLDMAN_SIZE_5,2.2*OLDMAN_SIZE_5,2.2*OLDMAN_SIZE_5);
      scen.endFrontDraw();
      displayFrontOldMan(OLDMAN_SIZE_2,scen.getFrontWidth()-1.6*OLDMAN_SIZE_2,0);
      displayFrontOldMan(OLDMAN_SIZE_3,scen.getFrontWidth()-2.2*OLDMAN_SIZE_2-1.6*OLDMAN_SIZE_3,0);
      displayFrontOldMan(OLDMAN_SIZE_4,scen.getFrontWidth()-2.2*(OLDMAN_SIZE_2+OLDMAN_SIZE_3)-1.6*OLDMAN_SIZE_4,0);
      displayFrontOldMan(OLDMAN_SIZE_5,scen.getFrontWidth()-2.2*(OLDMAN_SIZE_2+OLDMAN_SIZE_3+OLDMAN_SIZE_4)-1.6*OLDMAN_SIZE_5,0);
      break;
    case 112:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 113:
      scen.backgroundAll(BACKGROUND_BLACK);
      break;
    case 114:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 115:
      scen.backgroundAll(BACKGROUND_BLACK);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(BACKGROUND_WATER);
      scen.front.offscreen.rect(scen.getFrontWidth()/2,scen.getHeight()/2,scen.getFrontWidth()/2,scen.getHeight()/2);
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.right.offscreen.noStroke();
      scen.right.offscreen.fill(BACKGROUND_WATER);
      scen.right.offscreen.rect(0,scen.getHeight()/2,scen.getSideWidth(),scen.getHeight()/2);
      scen.endRightDraw();
      break;
    case 116:
      scen.backgroundAll(BACKGROUND_BLACK);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(BACKGROUND_PINK);
      scen.front.offscreen.rect(scen.getFrontWidth()-(scen.getFrontWidth()/2+scen.getSideWidth())/2+scen.getSideWidth(),scen.getHeight()/4,(scen.getFrontWidth()/2+scen.getSideWidth())/2+scen.getSideWidth(),scen.getHeight()*3/4);
      scen.endFrontDraw();
      scen.beginRightDraw();
      scen.right.offscreen.noStroke();
      scen.right.offscreen.fill(BACKGROUND_PINK);
      scen.right.offscreen.rect(0,scen.getHeight()/4,scen.getSideWidth(),scen.getHeight()*3/4);
      scen.endRightDraw();
      break;
    case 117:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 118:
      scen.backgroundAll(BACKGROUND_WATER);
      break;
    case 119:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 120:
      scen.backgroundAll(BACKGROUND_PINK);
      break;
    case 121:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 122:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 123:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 124:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 125:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 126:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 127:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 128:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      // セリフ
      break;
    case 129:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 130:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 131:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 132:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 133:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 134:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 135:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 136:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 137:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 138:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 139:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 140:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 141:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 142:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 143:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 144:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 145:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 146:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 147:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 148:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      // セリフ
      break;
    case 149:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 150:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 151:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 152:
      scen.onRightLight();
      break;
    case 153:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      break;
    case 154:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 155:
      scen.backgroundAll(BACKGROUND_YELLOW_V2);
      rain.run();
      displayWave();
      // セリフ
      break;
    case 156:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 157:
      scen.backgroundAll(BACKGROUND_PINK_V2);
      town.run();
      rain.run();
      displayCenterStringSVG("朝朝朝",BIG_CHAR_SIZE,CHAR_BLACK,0);
      break;
    case 158:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayRadio();
      // セリフ
      // セリフ
      // セリフ
      // セリフ
      break;
    case 159:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(OLDMAN_BACK_6);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2*OLDMAN_CHAR_SIZE+OLDMAN_CHAR_SIZE/2,OLDMAN_CHAR_SIZE*0.2+OLDMAN_CHAR_SIZE,OLDMAN_CHAR_SIZE*2.2,OLDMAN_CHAR_SIZE*2.2);
      scen.endFrontDraw();
      displayFrontOldMan(OLDMAN_CHAR_SIZE,scen.getFrontWidth()-2*OLDMAN_CHAR_SIZE,OLDMAN_CHAR_SIZE*0.1);
      break;
    case 160:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayRadio();
      // セリフ
      break;
    case 161:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(OLDMAN_BACK_6);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2*OLDMAN_CHAR_SIZE+OLDMAN_CHAR_SIZE/2,OLDMAN_CHAR_SIZE*0.2+OLDMAN_CHAR_SIZE,OLDMAN_CHAR_SIZE*2.2,OLDMAN_CHAR_SIZE*2.2);
      scen.endFrontDraw();
      displayFrontOldMan(OLDMAN_CHAR_SIZE,scen.getFrontWidth()-2*OLDMAN_CHAR_SIZE,OLDMAN_CHAR_SIZE*0.1);
      break;
    case 162:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 163:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 164:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 165:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 166:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 167:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 168:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 169:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 170:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("犬",DOG_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1,scen.getHeight()-DOG_CHAR_SIZE*1.1);
      break;
    case 171:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("犬",DOG_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1,scen.getHeight()-DOG_CHAR_SIZE*1.1);
      displayFrontStringSVG("猫",CAT_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1);
      break;
    case 172:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("犬",DOG_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1,scen.getHeight()-DOG_CHAR_SIZE*1.1);
      displayFrontStringSVG("猫",CAT_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1);
      displayFrontStringSVG("鼠",MICKY_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1-MICKY_CHAR_SIZE*1.1);
      break;
    case 173:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("犬",DOG_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1,scen.getHeight()-DOG_CHAR_SIZE*1.1);
      displayFrontStringSVG("猫",CAT_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1);
      displayFrontStringSVG("鼠",MICKY_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1-MICKY_CHAR_SIZE*1.1);
      // セリフ
      break;
    case 174:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("犬",DOG_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1,scen.getHeight()-DOG_CHAR_SIZE*1.1);
      displayFrontStringSVG("猫",CAT_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1);
      displayFrontStringSVG("鼠",MICKY_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1-MICKY_CHAR_SIZE*1.1);
      // セリフ
      break;
    case 175:
      scen.backgroundAll(BACKGROUND_WHITE);
      displayFrontStringSVG("犬",DOG_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1,scen.getHeight()-DOG_CHAR_SIZE*1.1);
      displayFrontStringSVG("猫",CAT_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1);
      displayFrontStringSVG("鼠",MICKY_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1-MICKY_CHAR_SIZE*1.1);
      displayLeftStringSVG("猿",MONKEY_CHAR_SIZE,CHAR_BLACK,scen.getSideWidth()-MONKEY_CHAR_SIZE*1.1,scen.getHeight()-MONKEY_CHAR_SIZE*1.1);
      break;
    case 176:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(OLDMAN_BACK_2);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-1.1*OLDMAN_SIZE_2,1.1*OLDMAN_SIZE_2,2.2*OLDMAN_SIZE_2,2.2*OLDMAN_SIZE_2);
      scen.front.offscreen.fill(OLDMAN_BACK_3);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2.2*OLDMAN_SIZE_2-1.1*OLDMAN_SIZE_3,1.1*OLDMAN_SIZE_3,2.2*OLDMAN_SIZE_3,2.2*OLDMAN_SIZE_3);
      scen.front.offscreen.fill(OLDMAN_BACK_4);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2.2*(OLDMAN_SIZE_2+OLDMAN_SIZE_3)-1.1*OLDMAN_SIZE_4,1.1*OLDMAN_SIZE_4,2.2*OLDMAN_SIZE_4,2.2*OLDMAN_SIZE_4);
      scen.front.offscreen.fill(OLDMAN_BACK_5);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2.2*(OLDMAN_SIZE_2+OLDMAN_SIZE_3+OLDMAN_SIZE_4)-1.1*OLDMAN_SIZE_5,1.1*OLDMAN_SIZE_5,2.2*OLDMAN_SIZE_5,2.2*OLDMAN_SIZE_5);
      scen.endFrontDraw();
      displayFrontOldMan(OLDMAN_SIZE_2,scen.getFrontWidth()-1.6*OLDMAN_SIZE_2,0);
      displayFrontOldMan(OLDMAN_SIZE_3,scen.getFrontWidth()-2.2*OLDMAN_SIZE_2-1.6*OLDMAN_SIZE_3,0);
      displayFrontOldMan(OLDMAN_SIZE_4,scen.getFrontWidth()-2.2*(OLDMAN_SIZE_2+OLDMAN_SIZE_3)-1.6*OLDMAN_SIZE_4,0);
      displayFrontOldMan(OLDMAN_SIZE_5,scen.getFrontWidth()-2.2*(OLDMAN_SIZE_2+OLDMAN_SIZE_3+OLDMAN_SIZE_4)-1.6*OLDMAN_SIZE_5,0);
      displayFrontStringSVG("犬",DOG_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1,scen.getHeight()-DOG_CHAR_SIZE*1.1);
      displayFrontStringSVG("猫",CAT_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1);
      displayFrontStringSVG("鼠",MICKY_CHAR_SIZE,CHAR_BLACK,scen.getFrontWidth()/2-DOG_CHAR_SIZE*1.1-CAT_CHAR_SIZE*1.1,scen.getHeight()-CAT_CHAR_SIZE*1.1-MICKY_CHAR_SIZE*1.1);
      displayLeftStringSVG("猿",MONKEY_CHAR_SIZE,CHAR_BLACK,scen.getSideWidth()-MONKEY_CHAR_SIZE*1.1,scen.getHeight()-MONKEY_CHAR_SIZE*1.1);
      break;
    case 177:
      scen.backgroundAll(BACKGROUND_BLACK);
      break;
    case 178:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 179:
      scen.backgroundAll(BACKGROUND_WATER);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(OLDMAN_BACK_7_PURPLE);
      scen.front.offscreen.ellipse(scen.getFrontWidth()-2*OLDMAN_CHAR_SIZE+OLDMAN_CHAR_SIZE/2,OLDMAN_CHAR_SIZE*0.2+OLDMAN_CHAR_SIZE,OLDMAN_CHAR_SIZE*2.2,OLDMAN_CHAR_SIZE*2.2);
      scen.endFrontDraw();
      displayFrontOldMan(OLDMAN_CHAR_SIZE,scen.getFrontWidth()-2*OLDMAN_CHAR_SIZE,OLDMAN_CHAR_SIZE*0.1);
      break;
    case 180:
      scen.backgroundAll(BACKGROUND_WATER);
      rain.run();
      break;
    case 181:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 182:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 183:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 184:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 185:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 186:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 187:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 188:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 189:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 190:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 191:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 192:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 193:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      // セリフ
      break;
    case 194:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 195:
      scen.backgroundAll(BACKGROUND_ORANGE);
      break;
    case 196:
      displayFire();
      break;
    case 197:
      displayFire();
      // セリフ
      // セリフ
      break;
    case 198:
      displayFire();
      // セリフ
      break;
    case 199:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 200:
      scen.backgroundAll(BACKGROUND_WHITE);
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(OLDMAN_BACK_6);
      scen.front.offscreen.ellipse(scen.getFrontWidth()/2-OLDMAN_CHAR_SIZE/2,0,5*OLDMAN_CHAR_SIZE,5*OLDMAN_CHAR_SIZE);
      scen.endFrontDraw();
      displayFrontOldMan(OLDMAN_CHAR_SIZE,scen.getFrontWidth()/2-OLDMAN_CHAR_SIZE,-OLDMAN_CHAR_SIZE/3);
      break;
    case 201:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 202:
      scen.backgroundAll(BACKGROUND_BLACK);
      break;
    case 203:
      scen.backgroundAll(BACKGROUND_WATER);
      break;
    case 204:
      scen.backgroundAll(BACKGROUND_RED);
      break;
    case 205:
      scen.backgroundAll(BACKGROUND_RED);
      // セリフ
      // セリフ
      break;
    case 206:
      scen.backgroundAll(BACKGROUND_RED);
      // セリフ
      break;
    case 207:
      scen.backgroundAll(BACKGROUND_RED);
      break;
    case 208:
      scen.backgroundAll(BACKGROUND_BLACK);
      break;
    case 209:
      scen.backgroundAll(BACKGROUND_WHITE);
      for(i = 0;i < speaker.size();i++) speaker.get(i).display();
      scen.beginFrontDraw();
      scen.front.offscreen.noStroke();
      scen.front.offscreen.fill(BACKGROUND_BLACK);
      scen.front.offscreen.rect(0,0,scen.getFrontWidth(),scen.getHeight()/2);
      scen.endFrontDraw();
      scen.beginLeftDraw();
      scen.left.offscreen.noStroke();
      scen.left.offscreen.fill(BACKGROUND_BLACK);
      scen.left.offscreen.rect(0,0,scen.getSideWidth(),scen.getHeight()/2);
      scen.endLeftDraw();
      scen.beginRightDraw();
      scen.right.offscreen.noStroke();
      scen.right.offscreen.fill(BACKGROUND_BLACK);
      scen.right.offscreen.rect(0,0,scen.getSideWidth(),scen.getHeight()/2);
      scen.endRightDraw();
      // セリフ
      break;
    case 210:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 211:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 212:
      displayHighway();
      break;
    case 213:
      displayHighway();
      // セリフ
      break;
    case 214:
      displayHighway();
      break;
    case 215:
      //トラックくる
      truckSize += 2;
      scen.backgroundSide(BACKGROUND_BLACK);
      scen.backgroundFront(BACKGROUND_WHITE);
      displayTruck(truckSize*RATE);
      break;
    case 216:
      scen.backgroundAll(RUN_AWAY_YELLOW);
      break;
    case 217:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 218:
      //戦車いる
      scen.backgroundSide(BACKGROUND_BLACK);
      scen.backgroundFront(BACKGROUND_WHITE);
      displayTank(tankSize*RATE);
      break;
    case 219:
      //戦車いる
      scen.backgroundSide(BACKGROUND_BLACK);
      scen.backgroundFront(BACKGROUND_WHITE);
      displayTank(tankSize*RATE);
      // セリフ
      break;
    case 220:
      scen.onRightLight();
      break;
    case 221:
      scen.onLeftLight();
      break;
    case 222:
      //戦車くる
      tankSize++;
      scen.backgroundSide(BACKGROUND_BLACK);
      scen.backgroundFront(BACKGROUND_WHITE);
      displayTank(tankSize*RATE);
      break;
    case 223:
      //戦車くる
      tankSize++;
      scen.backgroundSide(BACKGROUND_BLACK);
      scen.backgroundFront(BACKGROUND_WHITE);
      displayTank(tankSize*RATE);
      // セリフ
      break;
    case 224:
      //戦車くる
      tankSize++;
      scen.backgroundSide(BACKGROUND_BLACK);
      scen.backgroundFront(BACKGROUND_WHITE);
      displayTank(tankSize*RATE);
      // セリフ
      break;
    case 225:
      //戦車くる
      tankSize++;
      scen.backgroundSide(BACKGROUND_BLACK);
      scen.backgroundFront(BACKGROUND_WHITE);
      displayTank(tankSize*RATE);
      // セリフ
      break;
    case 226:
      //戦車くる
      tankSize++;
      scen.backgroundSide(BACKGROUND_BLACK);
      scen.backgroundFront(BACKGROUND_WHITE);
      displayTank(tankSize*RATE);
      break;
    case 227:
      scen.backgroundAll(RUN_AWAY_YELLOW);
      break;
    case 228:
      scen.backgroundAll(BACKGROUND_WHITE);
      break;
    case 229:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 230:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 231:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 232:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 233:
      scen.backgroundAll(BACKGROUND_BLACK);
      //displayCenterTopStringSVG("・・・・",NORMAL_CHAR_SIZE,CHAR_WHITE);
      displayDotSVG(NORMAL_CHAR_SIZE,CHAR_WHITE);
      break;
    case 234:
      scen.backgroundAll(BACKGROUND_LIME);
      break;
    case 235:
      scen.backgroundAll(BACKGROUND_NAVY);
      break;
    case 236:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 237:
      scen.backgroundAll(BACKGROUND_WHITE);
      // セリフ
      break;
    case 238:
      scen.backgroundAll(BACKGROUND_BLACK);
      break;
    case 239:
      backgroundImg(starBack2);
      break;
    case 240:
      backgroundImg(starBack2);
      // セリフ
      break;
    case 241:
      backgroundImg(starBack2);
      // セリフ
      break;
    case 242:
      backgroundImg(starBack2);
      break;
    case 243:
      scen.backgroundAll(BACKGROUND_BLACK);
      break;
    default:
      p--;
      break;	
  }
}
void displayFire(){
  float w = scen.getAllWidth()/3;
  scen.backgroundAll(BACKGROUND_BLACK);
  scen.beginFrontDraw();
  scen.front.offscreen.noStroke();
  scen.front.offscreen.fill(BACKGROUND_ORANGE);
  scen.front.offscreen.rect(w-scen.getSideWidth(),0,w,scen.getHeight());
  scen.endFrontDraw();
}
void displayRadio(){
  float w = scen.getFrontWidth()/3;
  float h = w*2/3;
  float curve = h/10;
  float circlePointW = scen.getFrontWidth()/2-w/4;
  float circlePointH = scen.getHeight()-h/2-curve;
  float pointSize = curve*1;
  float r = pointSize*2;
  float th = 60;
  float barHeight = h/12;
  float barWidth = w*0.4;
  float p;
  int i;
  scen.beginFrontDraw();
  scen.front.offscreen.noStroke();
  scen.front.offscreen.fill(RADIO_GRAY);
  scen.front.offscreen.rect((scen.getFrontWidth()-w)/2,scen.getHeight()-h-curve,w,h,curve);
  scen.front.offscreen.strokeWeight(curve);
  scen.front.offscreen.stroke(RADIO_GRAY);
  scen.front.offscreen.line(scen.getFrontWidth()/2+w*0.3,scen.getHeight()-h-curve,scen.getFrontWidth()/2+w*0.3,scen.getHeight()-h-curve-h*0.7);
  scen.front.offscreen.noStroke();
  scen.front.offscreen.fill(RADIO_WHITE);
  scen.front.offscreen.ellipse(circlePointW,circlePointH,pointSize,pointSize);
  for(i = 0;i < 6;i++){
    scen.front.offscreen.ellipse(circlePointW+r*cos(PI*i*th/180),circlePointH+r*sin(PI*i*th/180),pointSize,pointSize);
  }
  scen.front.offscreen.rect(scen.getFrontWidth()/2+w*0.05,scen.getHeight()-h-curve+h*0.2,barWidth,2*barHeight,5*RATE);
  scen.front.offscreen.rect(scen.getFrontWidth()/2+w*0.05,scen.getHeight()-h-curve+h*0.2+barHeight*3.5,barWidth,barHeight,5*RATE);
  scen.front.offscreen.rect(scen.getFrontWidth()/2+w*0.05,scen.getHeight()-h-curve+h*0.2+barHeight*5,barWidth,barHeight,5*RATE);
  scen.front.offscreen.rect(scen.getFrontWidth()/2+w*0.05,scen.getHeight()-h-curve+h*0.2+barHeight*6.5,barWidth,barHeight,5*RATE);
  scen.front.offscreen.strokeWeight(1);
  scen.front.offscreen.stroke(RADIO_BLACK);
  p = 0.9*barWidth/10;
  for(i = 0;i < 10;i++){
    scen.front.offscreen.line(scen.getFrontWidth()/2+w*0.05+p*(i+1),scen.getHeight()-h-curve+h*0.2+0.1*barHeight,scen.getFrontWidth()/2+w*0.05+p*(i+1),scen.getHeight()-h-curve+h*0.2+barHeight);
  }
  scen.front.offscreen.stroke(RADIO_RED);
  p = random(scen.getFrontWidth()/2+w*0.05,scen.getFrontWidth()/2+w*0.05+barWidth);
  scen.front.offscreen.line(p,scen.getHeight()-h-curve+h*0.2+barHeight*3.5,p,scen.getHeight()-h-curve+h*0.2+barHeight*3.5+barHeight);
  p = random(scen.getFrontWidth()/2+w*0.05,scen.getFrontWidth()/2+w*0.05+barWidth);
  scen.front.offscreen.line(p,scen.getHeight()-h-curve+h*0.2+barHeight*5,p,scen.getHeight()-h-curve+h*0.2+barHeight*5+barHeight);
  p = random(scen.getFrontWidth()/2+w*0.05,scen.getFrontWidth()/2+w*0.05+barWidth);
  scen.front.offscreen.line(p,scen.getHeight()-h-curve+h*0.2+barHeight*6.5,p,scen.getHeight()-h-curve+h*0.2+barHeight*6.5+barHeight);
  scen.front.offscreen.strokeWeight(curve/2);
  scen.front.offscreen.stroke(RADIO_YELLOW);
  scen.front.offscreen.fill(RADIO_YELLOW);
  scen.front.offscreen.line(scen.getFrontWidth()/2+w*0.3,scen.getHeight()-h-curve-h*0.7,scen.getFrontWidth()/2+w*0.3+w*0.2,scen.getHeight()-h-curve-h*0.7-h*0.3);
  scen.front.offscreen.line(scen.getFrontWidth()/2+w*0.3+w*0.2,scen.getHeight()-h-curve-h*0.7-h*0.3,scen.getFrontWidth()/2+w*0.3-w*0.2,scen.getHeight()-h-curve-h*0.7-h*0.5);
  scen.front.offscreen.line(scen.getFrontWidth()/2+w*0.3-w*0.2,scen.getHeight()-h-curve-h*0.7-h*0.5, scen.getFrontWidth()/2+w*0.3+w*0.3,scen.getHeight()-h-curve-h*0.7-h*0.8);
  scen.front.offscreen.rect(0,0,scen.getFrontWidth(),scen.getHeight()-h-curve-h*0.7-h*0.8);
  scen.endFrontDraw();
  scen.beginLeftDraw();
  scen.left.offscreen.fill(RADIO_YELLOW);
  scen.left.offscreen.noStroke();
  scen.left.offscreen.rect(0,0,scen.getSideWidth(),scen.getHeight()-h-curve-h*0.7-h*0.8);
  scen.endLeftDraw();
  scen.beginRightDraw();
  scen.right.offscreen.fill(RADIO_YELLOW);
  scen.right.offscreen.noStroke();
  scen.right.offscreen.rect(0,0,scen.getSideWidth(),scen.getHeight()-h-curve-h*0.7-h*0.8);
  scen.endRightDraw();
}
void displayWave(){
  float th1 = 8*PI/180;
  float th2 = 45*PI/180;
  scen.beginLeftDraw();
  scen.left.offscreen.noStroke();
  scen.left.offscreen.fill(WATER_1);
  scen.left.offscreen.rect(0,scen.getHeight()*2/3,scen.getSideWidth(),scen.getHeight()/3);
  scen.left.offscreen.fill(WATER_2);
  scen.left.offscreen.beginShape();
  scen.left.offscreen.vertex(0,scen.getHeight());
  scen.left.offscreen.vertex(scen.getSideWidth(),scen.getHeight());
  scen.left.offscreen.vertex(scen.getSideWidth(),scen.getHeight()-scen.getSideWidth()*tan(th1));
  scen.left.offscreen.endShape();
  scen.endLeftDraw();
  scen.beginFrontDraw();
  scen.front.offscreen.noStroke();
  scen.front.offscreen.fill(WATER_1);
  scen.front.offscreen.rect(0,scen.getHeight()*2/3,scen.getFrontWidth(),scen.getHeight()/3);
  scen.front.offscreen.fill(WATER_2);
  scen.front.offscreen.beginShape();
  scen.front.offscreen.vertex(0,scen.getHeight());
  scen.front.offscreen.vertex(0,scen.getHeight()-scen.getSideWidth()*tan(th1));
  scen.front.offscreen.vertex(scen.getFrontWidth(),scen.getHeight()-(scen.getFrontWidth()+scen.getSideWidth())*tan(th1));
  scen.front.offscreen.vertex(scen.getFrontWidth(),scen.getHeight());
  scen.front.offscreen.endShape();
  scen.endFrontDraw();
  scen.beginRightDraw();
  scen.right.offscreen.noStroke();
  scen.right.offscreen.fill(WATER_1);
  scen.right.offscreen.rect(0,scen.getHeight()*2/3,scen.getFrontWidth(),scen.getHeight()/3);
  scen.right.offscreen.fill(WATER_2);
  scen.right.offscreen.beginShape();
  scen.right.offscreen.vertex(0,scen.getHeight());
  scen.right.offscreen.vertex(0,scen.getHeight()-(scen.getFrontWidth()+scen.getSideWidth())*tan(th1));
  scen.right.offscreen.vertex(scen.getSideWidth(),scen.getHeight()-(scen.getFrontWidth()+2*scen.getSideWidth())*tan(th1));
  scen.right.offscreen.vertex(scen.getSideWidth(),scen.getHeight());
  scen.right.offscreen.endShape();
  scen.endRightDraw();
}
void displayAlert(){
  float size;
  size = scen.getHeight()/8.1;
  scen.backgroundAll(BACKGROUND_YELLOW);
  // セリフ
  // セリフ
  // セリフ
  // セリフ
  // セリフ
  // セリフ
  // セリフ
}
void displayFrontStringSVG(String str,float size,color c,float x,float y){
  PShape ps;
  int strSize;
  ps = loadShape(STRING_DATA_PATH+"/"+str+".svg");
  ps.disableStyle();
  strSize = str.length();
  scen.beginFrontDraw();
  scen.front.offscreen.fill(c);
  scen.front.offscreen.noStroke();
  scen.front.offscreen.shape(ps,x,y,size*strSize,size);
  scen.endFrontDraw();  
}
void displayLeftStringSVG(String str,float size,color c,float x,float y){
  PShape ps;
  int strSize;
  ps = loadShape(STRING_DATA_PATH+"/"+str+".svg");
  ps.disableStyle();
  strSize = str.length();
  scen.beginLeftDraw();
  scen.left.offscreen.fill(c);
  scen.left.offscreen.noStroke();
  scen.left.offscreen.shape(ps,x,y,size*strSize,size);
  scen.endLeftDraw();  
}
void displayStringSVG(String str,float size,color c,float x,float y){
  PShape ps;
  int strSize;
  ps = loadShape(STRING_DATA_PATH+"/"+str+".svg");
  ps.disableStyle();
  strSize = str.length();
  if(x < scen.getSideWidth()){
    scen.beginLeftDraw();
    scen.left.offscreen.fill(c);
    scen.left.offscreen.noStroke();
    scen.left.offscreen.shape(ps,x,y,size*strSize,size);
    scen.endLeftDraw();
  }
  if(x < scen.getSideWidth()+scen.getFrontWidth() && scen.getSideWidth() < x+strSize*size){
    scen.beginFrontDraw();
    scen.front.offscreen.fill(c);
    scen.front.offscreen.noStroke();
    scen.front.offscreen.shape(ps,x-scen.getSideWidth(),y,size*strSize,size);
    scen.endFrontDraw();
  }
  if(scen.getSideWidth()+scen.getFrontWidth() < x+(strSize+1)*size ){
    scen.beginRightDraw();
    scen.right.offscreen.fill(c);
    scen.right.offscreen.noStroke();
    scen.right.offscreen.shape(ps,x-(scen.getSideWidth()+scen.getFrontWidth()),y,size*strSize,size);
    scen.endRightDraw();
  }
}

void displayCenterStringSVG(String str,float size,color c,float y){
  float x;
  x = scen.getSideWidth()+scen.getFrontWidth()/2;
  x -= str.length()*size/2;
  displayStringSVG(str,size,c,x,y);
}

void displayCenterTopStringSVG(String str,float size,color c){
  displayCenterStringSVG(str,size,c,STRING_TOP_MAX);
}

void displayCentralStringSVG(String str,float size,color c){
  float y;
  y = scen.getHeight()/2;
  y -= size*0.6;
  displayCenterStringSVG(str,size,c,y);
}

void displayFrontOldMan(float size,float x,float y){
  PShape ps;
  ps = loadShape(STRING_DATA_PATH+"/老人.svg");
  scen.beginFrontDraw();
  scen.front.offscreen.fill(CHAR_BLACK);
  scen.front.offscreen.noStroke();
  scen.front.offscreen.shape(ps,x,y,size,size*2);
  scen.endFrontDraw();
}
void displayRightOldMan(float size,float x,float y){
  PShape ps;
  ps = loadShape(STRING_DATA_PATH+"/老人.svg");
  scen.beginRightDraw();
  scen.right.offscreen.fill(CHAR_BLACK);
  scen.right.offscreen.noStroke();
  scen.right.offscreen.shape(ps,x,y,size,size*2);
  scen.endRightDraw();
}
void displayFrontUnderOldMan(float size,float x){
  float y;
  y = scen.getHeight()-2.2*size;
  displayFrontOldMan(size,x,y);
}
void displayRightUnderOldMan(float size,float x){
  float y;
  y = scen.getHeight()-2.2*size;
  displayRightOldMan(size,x,y);
}
void displaySmartPhone(color c){
  float h = scen.getHeight()*0.8;
  float w = h*0.58;
  float pCurve = h*0.06;
  float space = h*0.05;
  float coverSize = h*0.01;
  scen.beginFrontDraw();
  scen.front.offscreen.strokeWeight(coverSize);
  scen.front.offscreen.stroke(SMARTPHONE_BROWN);
  scen.front.offscreen.fill(SMARTPHONE_BLACK);
  scen.front.offscreen.rect((scen.getFrontWidth()-w)/2,0.1*scen.getHeight(),w,h,pCurve);
  scen.front.offscreen.noStroke();
  scen.front.offscreen.fill(c);
  scen.front.offscreen.rect(scen.getFrontWidth()/2-w/2+space,scen.getHeight()/2-h/2+2*space,w-2*space,h*0.7);
  scen.front.offscreen.noFill();
  scen.front.offscreen.strokeWeight(coverSize*0.1);
  scen.front.offscreen.stroke(SMARTPHONE_RING);
  scen.front.offscreen.ellipse(scen.getFrontWidth()/2, scen.getHeight()/2+h*0.4,w*0.1,w*0.1);
  scen.endFrontDraw();
}
void displayTV(color c){
  float w = scen.getAllWidth()*0.65;
  float sideW = (w-scen.getFrontWidth())/2;
  float h = w*0.61;
  float y = 0.15*scen.getHeight();
  float coverSize = w*0.026;
  float coverCurve = w*0.026;
  float standSizeX = w/2;
  float standSizeY = h*0.05;
  scen.beginLeftDraw();
  scen.left.offscreen.noStroke();
  scen.left.offscreen.fill(TV_BKACK);
  scen.left.offscreen.rect(scen.getSideWidth()-sideW-coverSize,y-coverSize,sideW+2*coverSize,h+2*coverSize,coverCurve);
  scen.left.offscreen.fill(c);
  scen.left.offscreen.rect(scen.getSideWidth()-sideW,y,(w-scen.getFrontWidth())/2,h);
  scen.endLeftDraw();
  scen.beginFrontDraw();
  scen.front.offscreen.noStroke();
  scen.front.offscreen.fill(TV_BKACK);
  scen.front.offscreen.rect(0,y-coverSize,scen.getFrontWidth(),coverSize);
  scen.front.offscreen.rect(0,y+h,scen.getFrontWidth(),coverSize);
  scen.front.offscreen.rect((scen.getFrontWidth())/2-standSizeY,y+h+coverSize,2*standSizeY,2*standSizeY);
  scen.front.offscreen.rect((scen.getFrontWidth()-standSizeX)/2,y+h+coverSize+2*standSizeY,standSizeX,standSizeY);
  scen.front.offscreen.fill(c);
  scen.front.offscreen.rect(0,y,scen.getFrontWidth(),h);
  scen.endFrontDraw();
  scen.beginRightDraw();
  scen.right.offscreen.noStroke();
  scen.right.offscreen.fill(TV_BKACK);
  scen.right.offscreen.rect(-coverSize,y-coverSize,sideW+2*coverSize,h+2*coverSize,coverCurve);
  scen.right.offscreen.fill(c);
  scen.right.offscreen.rect(0,y,sideW,h);
  scen.endRightDraw();
}
void displayVarietyTV(){
  float w = scen.getAllWidth()*0.65;
  float triangleW = scen.getAllWidth()*0.65/3;
  float sideW = (w-scen.getFrontWidth())/2;
  float h = w*0.61;
  float y = 0.15*scen.getHeight();
  
  displayTV(VARIETY_A);
  scen.beginLeftDraw();
  scen.left.offscreen.fill(VARIETY_B);
  scen.left.offscreen.triangle(scen.getSideWidth()-sideW,y,scen.getSideWidth()-sideW,y+h,scen.getSideWidth()-sideW+triangleW/2,y);
  scen.endLeftDraw();
  scen.beginFrontDraw();
  scen.front.offscreen.noStroke();
  scen.front.offscreen.fill(VARIETY_B);
  scen.front.offscreen.triangle(-sideW,y,-sideW,y+h,-sideW+triangleW/2,y);
  scen.front.offscreen.triangle(-sideW+triangleW/2,y,-sideW+triangleW,y+h,-sideW+triangleW*3/2,y);
  scen.front.offscreen.triangle(-sideW+triangleW*3/2,y,-sideW+triangleW*2,y+h,-sideW+triangleW*5/2,y);
  scen.front.offscreen.triangle(-sideW+triangleW*5/2,y,-sideW+triangleW*3,y+h,-sideW+triangleW*3,y);
  scen.endFrontDraw();
  scen.beginRightDraw();
  scen.right.offscreen.fill(VARIETY_B);
  scen.right.offscreen.triangle(sideW,y,sideW,y+h,sideW-triangleW/2,y);
  scen.endRightDraw();
}
void displayTruck(float size){
  scen.beginFrontDraw();
  scen.front.offscreen.noStroke();
  scen.front.offscreen.pushMatrix();
  scen.front.offscreen.translate(scen.getFrontWidth()/2-0.6*size,scen.getHeight()/2-0.2*size);
  scen.front.offscreen.fill(TRUCK_BLUE);
  scen.front.offscreen.rect(-size*0.05,-size*0.3,size*1.3,size);
  scen.front.offscreen.fill(TRUCK_BASE_WHITE);
  scen.front.offscreen.rect(0,size*0.4,size*1.2,size*0.6);
  scen.front.offscreen.rect(-0.1*size,0.1*size,1.4*size,0.2*size);
  scen.front.offscreen.fill(TRUCK_BLACK);
  scen.front.offscreen.rect(0,0,size*1.2,size*0.4);
  scen.front.offscreen.rect(size*0.1,size,size*0.3,size*0.2);
  scen.front.offscreen.rect(size*0.8,size,size*0.3,size*0.2);
  scen.front.offscreen.fill(TRUCK_LIGHT);
  scen.front.offscreen.rect(0.1*size,0.5*size,0.2*size,0.2*size);
  scen.front.offscreen.rect(0.9*size,0.5*size,0.2*size,0.2*size);
  scen.front.offscreen.popMatrix();
  scen.endFrontDraw();
}
void displayHighway(){
  float w1 = scen.getFrontWidth()/5;
  float sideW1 = w1/10;
  scen.backgroundSide(BACKGROUND_BLACK);
  scen.backgroundFront(NORMAL_TOWN);
  scen.beginFrontDraw();
  scen.front.offscreen.noStroke();
  //町の小道
  //縦
  scen.front.offscreen.fill(ROAD_SIDE_WHITE);
  scen.front.offscreen.rect(scen.getFrontWidth()*0.2,0,sideW1,scen.getHeight());
  scen.front.offscreen.rect(scen.getFrontWidth()*0.7,0,sideW1,scen.getHeight());
  scen.front.offscreen.rect(scen.getFrontWidth()*0.85,0,sideW1,scen.getHeight());
  //横
  scen.front.offscreen.rect(0,scen.getHeight()*0.1,scen.getFrontWidth(),sideW1);
  scen.front.offscreen.rect(0,scen.getHeight()*0.2,scen.getFrontWidth(),sideW1);
  scen.front.offscreen.rect(0,scen.getHeight()*0.3,scen.getFrontWidth(),sideW1);
  scen.front.offscreen.rect(0,scen.getHeight()*0.4,scen.getFrontWidth(),sideW1);
  scen.front.offscreen.rect(0,scen.getHeight()*0.5,scen.getFrontWidth(),sideW1);
  scen.front.offscreen.rect(0,scen.getHeight()*0.9,scen.getFrontWidth(),sideW1);
  //ビル
  scen.front.offscreen.fill(BUILDING_COLOR);
  scen.front.offscreen.rect(scen.getFrontWidth()*0.7+sideW1,scen.getHeight()*0.1+sideW1,scen.getFrontWidth()*0.15-sideW1,scen.getHeight()*0.2-sideW1);
  scen.front.offscreen.rect(0,scen.getHeight()*0.5+sideW1,scen.getFrontWidth()*0.2,scen.getHeight()*0.5-sideW1);
  //真ん中縦道路
  scen.front.offscreen.fill(ROAD_GRAY);
  scen.front.offscreen.rect((scen.getFrontWidth()-w1)/2,0,w1,scen.getHeight());
  scen.front.offscreen.fill(ROAD_SIDE_WHITE);
  scen.front.offscreen.rect((scen.getFrontWidth()-w1)/2-sideW1,0,sideW1,scen.getHeight());
  scen.front.offscreen.rect((scen.getFrontWidth()+w1)/2,0,sideW1,scen.getHeight());
  //横切り道路
  scen.front.offscreen.fill(ROAD_GRAY);
  scen.front.offscreen.rect(0,scen.getHeight()*0.7-w1/2,scen.getFrontWidth(),w1);
  scen.front.offscreen.fill(ROAD_SIDE_WHITE);
  scen.front.offscreen.rect(0,(scen.getHeight()*0.7-w1/2)-sideW1,scen.getFrontWidth(),sideW1);
  scen.front.offscreen.rect(0,scen.getHeight()*0.7+w1/2,scen.getFrontWidth(),sideW1);
  //バイパス？
  scen.front.offscreen.fill(ROAD_GRAY);
  scen.front.offscreen.beginShape();
  scen.front.offscreen.vertex(scen.getFrontWidth()/2+-4*sideW1,scen.getHeight()*0.1-4*sideW1);
  scen.front.offscreen.vertex(scen.getFrontWidth()/2+4*sideW1,scen.getHeight()*0.1+4*sideW1);
  scen.front.offscreen.vertex(scen.getFrontWidth()*0.9+4*sideW1,scen.getHeight()*0.7+4*sideW1);  
  scen.front.offscreen.vertex(scen.getFrontWidth()*0.9-4*sideW1,scen.getHeight()*0.7-4*sideW1);
  scen.front.offscreen.endShape();
  scen.endFrontDraw();
}
void displayTank(float size){
  scen.beginFrontDraw();
  scen.front.offscreen.noStroke();
  scen.front.offscreen.noStroke();
  scen.front.offscreen.pushMatrix();
  scen.front.offscreen.translate(scen.getFrontWidth()/2+RATE*random(-10,10),scen.getHeight()/2);
  scen.front.offscreen.fill(TANK_BLACK);
  scen.front.offscreen.rect(-size*0.7,size/5,size*0.4,size/3,size/20);
  scen.front.offscreen.rect(size*0.3,size/5,size*0.4,size/3,size/20);
  scen.front.offscreen.rect(size*0.3,-size/2,size/30,size/2);
  scen.front.offscreen.fill(TANK_MAIN_GREEN);
  scen.front.offscreen.rect(-size/2,-size/4,size,size/4,size/10);
  scen.front.offscreen.rect(-size*0.75,0,size*1.5,size/4,size/10);
  scen.front.offscreen.rect(-size*0.4,size/4,size*0.8,size/5);
  scen.front.offscreen.rect(-size/3,-size/3,size/3,size/3);
  scen.front.offscreen.fill(TANK_BLACK);
  scen.front.offscreen.ellipse(0,-size*0.1,size*0.1,size*0.1);
  scen.front.offscreen.popMatrix();
  scen.endFrontDraw();
}
void displayDotSVG(float size,color c){
  String dot = "・・・・";
  PShape ps;
  float y = STRING_TOP_MAX;
  float x = scen.getFrontWidth()/2-dot.length()*size/2;
  int strSize;
  ps = loadShape(STRING_DATA_PATH+"/"+dot+".svg");
  ps.disableStyle();
  strSize = dot.length();
  scen.beginFrontDraw();
  scen.front.offscreen.fill(c);
  scen.front.offscreen.noStroke();
  scen.front.offscreen.shape(ps,x,y,size*strSize,size/3);
  scen.endFrontDraw();
}
void backgroundImg(PImage back){
  scen.beginLeftDraw();
  scen.left.offscreen.image(back,0,0,scen.getHeight()*back.width/back.height,scen.getHeight());
  scen.endLeftDraw();
  scen.beginFrontDraw();
  scen.front.offscreen.image(back,-scen.getSideWidth(),0,scen.getHeight()*back.width/back.height,scen.getHeight());
  scen.endFrontDraw();
  scen.beginRightDraw();
  scen.right.offscreen.image(back,-(scen.getSideWidth()+scen.getFrontWidth()),0,scen.getHeight()*back.width/back.height,scen.getHeight());
  scen.endRightDraw();
}