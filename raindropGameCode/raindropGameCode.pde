//note to self: add dead, add scoreboard?, submit via pull request

ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();  //declare and initialize the ArrayList
int count = 100;
PVector mouse;   //declare a P
Raindrop [] r = new Raindrop [count];  //declare a new Raindrop called r
Catcher c;

void setup(){
  size(1200,800);
  noStroke();
  colorMode(HSB,360,100,100,100);
  c = new Catcher(50);
  mouse = new PVector();  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  raindrops.add(new Raindrop(mouseX,mouseY));  //add a new raindrop to the Raindrop ArrayList
}

void draw(){
  mouse.set(mouseX,mouseY);  //set value of mouse as mouseX,mouseY
  background(0,0,100);
  raindrops.add(new Raindrop(random(0,width),0));  //add a new raindrop to the Raindrop ArrayList
  
  for(int i = raindrops.size()-1; i >= 0; i--) {  //go through the ArrayList backwards to prevent flickering
    Raindrop r = raindrops.get(i);  //get the raindrop in location i and store it in Raindrop r
    r.display();  //display the raindrop
    r.fall();  //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    c.display();
    c.update();
    if(r.isDead()){  //if r is dead...
      raindrops.remove(i);  //remove particle at location i
    }
    if(r.isInContactWith(mouse)) {  //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r.rebirth();  //if it is, reset the raindrop
    }
    if(r.loc.y > height + r.diam/2) {  //check to see if the raindrop goes below the bottom of the screen
      r.rebirth();  //if it does, reset the raindrop
    }
  }
}