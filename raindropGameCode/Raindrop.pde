class Raindrop{
  //declaring all fields contained within the Raindrop class
  PVector loc,vel,acc;
  float hue,sat,bright,alpha;
  int diam;
  
  //set up constructor
  Raindrop(float x,float y){
    loc=new PVector(x,y);
    vel=PVector.random2D();
    acc=new PVector(0,.1);
    hue = random(360);
    sat = random(70, 90);
    bright = random(80, 100);
    alpha = 80;
    diam=100;
  }
  
  //define methods
  void display(){
    fill(hue, sat, bright, alpha);
    noStoke();
    ellipse(loc.x,loc.y,diam,diam);
    
    if(loc.x>width || loc.x<0){
      vel.x*=-1;
    }
    if(loc.y>height || loc.y<0){
      vel.y*=-1;
    }
  }
  
  void fall(){  //make raindrop fall
    vel.add(acc);
    loc.add(vel);
  }
  
  void dead(){
    if(loc.y>height+diam/2){
      return true;
    }else{
      return false;
    }
  }
  
  void rebirth(float x,float y) {
    loc.set(x,y);
    vel=PVector.random2D();
     }
  
boolean isInContactWith(PVector mouse){  //get rid of the rain
  float d=dist(loc.x,loc.y,mouse.x,mouse.y);   //determine if the mouse is within the circle/in contact
  boolean c;
     if(d<diam/2){
       c=true;
     }else{
       c=false;
     }
  return c;
}