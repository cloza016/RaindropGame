class Raindrop{
  //declaring all fields contained within the Raindrop class
  PVector loc,vel;
  int diam;
  color c;
  
  //set up constructor
  Raindrop(float x,float y){
    diam=200;
    loc=new PVector(random(diam,width-diam),random(diam,height-diam));
    vel=PVector.random2D();
    c=color(random(255),random(255),random(255));
  }
  
  //define methods
  void display(){
    fill(c);
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
    loc.y+=vel.x;
  }
  
  void reset(){
    if(r.isInContactWith(loc.dist<diam/2)){
      return true;
    }
    if(r.loc.y > height + r.diam/2){
      return false;
    } 
  }
  
  boolean isInContactWith(){
    
  }
}