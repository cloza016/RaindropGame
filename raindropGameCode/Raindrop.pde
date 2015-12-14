class Raindrop(){
  PVector loc,vel;
  int diam;
  color c;
  
  Ball(){
    diam=200;
    loc=new PVector(random(diam,width-diam),random(diam,height-diam));
    vel=PVector.random2D();
    c=color(random(255),random(50),random(100,255));
  }
  
  void display(){
    fill(c);
    noStoke();
    ellipse(loc.x,loc.y,diam,diam);
  }
  
  void move(){
    loc.add(vel);
  }
  
  void stay(){
    if(loc.x>width||loc.x<0){
      vel.x*=-1;
    }
    if(loc.y>height||loc.y<0){
      vel.y*=-1;
    }
  }
}

boolean isInContactWith(){
  
  
  
}