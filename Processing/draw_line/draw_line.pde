
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  fill(255, 0, 0);
  stroke(255);
  //rectMode(CENTER);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed() {
  background(0);
}

void keyPressed() {
  background(0,0,255);
}
