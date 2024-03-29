DoublePendulum[] pendulums;
ArrayList<float[]> colors;

void setup() {
  size(500, 500);

  colors = new ArrayList<float[]>();
  
  pendulums = new DoublePendulum[30];
  
  float theta1 = 0.1;
  float thetadot1 = 0;
  float length1 = 100;
  float mass1 = 1;
  float theta2 = 0.1;
  float thetadot2 = 0;
  float length2 = 100;
  
  for (int i = 0; i < pendulums.length; i++) {
    float mass2 = random(1, 90);

    pendulums[i] = new DoublePendulum(mass1, length1, theta1, thetadot1, mass2, length2, theta2, thetadot2);
    
    float r = random(255);
    float g = random(255);
    float b = random(255);
    
    colors.add(new float[]{r, g, b});
  }
}

void draw() {
  background(0);

  translate(width/2, height/2);

  for (int i = 0; i < pendulums.length; i++) {
    float[] xs = pendulums[i].getXs();
    float[] ys = pendulums[i].getYs();

    stroke(colors.get(i)[0], colors.get(i)[1], colors.get(i)[2]);
    line(0, 0, xs[1], ys[1]);
    line(xs[1], ys[1], xs[2], ys[2]);

    //ellipse(xs[1], ys[1], 0, 0);
    //ellipse(xs[2], ys[2], 13, 13);

    pendulums[i].updatePoints(0.03); //dt
  }
}
