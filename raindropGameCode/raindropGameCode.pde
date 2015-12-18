ArrayList<Raindrop> raindrop = new ArrayList<Raindrop>();  //declare and initialize the ArrayList
PVector mouse;   //declare a P


void setup(){
  size(1200,800);
  colorMode(HSB,360,100,100,100);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  raindrop.add(new Raindrop(mouseX,mouseY));  //add a new raindrop to the Raindrop ArrayList
}

void draw(){
  mouse.set(mouseX,mouseY);             //set value of mouse as mouseX,mouseY
  background(0,0,100);
  raindrop.add(new Raindrop(mouseX,mouseY));  //add a new raindrop to the Raindrop ArrayList
  
  for (int i = raindrop.size()-1; i >= 0; i--) {  //go through the ArrayList backwards to prevent flickering
    Raindrop r=raindrops.get(i);  //get the raindrop in location i and store it in Raindrop r
    r.display();  //display the raindrop
    r.fall();  //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    if (r.isDead()) {                 //if r is dead...
      raindrops.remove(i);    //remove particle at location i
    }
    
  
  if (r.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
    r.reset();                         //if it is, reset the raindrop
  }
  if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
    r.reset();                           //if it does, reset the raindrop
  }
}