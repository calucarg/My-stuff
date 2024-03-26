float circleX;

void setup(){
  size(900, 600);
  circleX = random(0,width);
}

void draw(){
  background(0);
  
  fill(255);
  ellipse(circleX,180,20,20);
  
  
 circleX += 0.3;
 println(circleX,180);
 
}
