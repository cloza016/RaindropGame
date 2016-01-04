class Raindrop{
  //declaring all fields contained within the Raindrop class
  PVector loc,vel,acc;
  float hue,sat,bright,alpha;
  int diam;
  
  //set up constructor
  Raindrop(float x,float y){
    loc = new PVector(x,y);
    vel = PVector.random2D();
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
  ellipse(loc.x,loc.y,diam,diam);
}
  
void fall(){  //make raindrop fall
  vel.add(acc);
  loc.add(vel);
  }
  
void rebirth() {
  loc.set(random(width),random(-height,0));
  vel.set(0,0);
}
  
boolean isInContactWith(PVector mouse){  //get rid of the rain
  if(loc.y>height+diam/2){
     return true;
    }else{
     return false;
     }
    }
  }