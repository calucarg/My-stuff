DoublePendulum pendulum;
PendulumSave pendulumSave;
float r = 255;
float g = 0;
float b = 255;
float t = 255;


void setup() {
  size(500, 500);

  float theta1 = 0.4;
  float thetadot1 = 0;
  float length1 = 100;
  float mass1 = 0.7;
  float theta2 = 2;
  float thetadot2 = 0;
  float length2 = 100;
  float mass2 = 0.5;

  pendulum = new DoublePendulum(mass1, length1, theta1, thetadot1, mass2, length2, theta2, thetadot2);
  pendulumSave = new PendulumSave();
}

void draw() {
  background(0);
  translate(width/2, height/2);

  float[] xs = pendulum.getXs();
  float[] ys = pendulum.getYs();

  pendulumSave.addPendulum(xs[1], ys[1], xs[2], ys[2], r, g, b, t);

  for (int i = 0; i < pendulumSave.pendulums.size(); i++) {
    float xs1 = pendulumSave.pendulums.get(i).get(0);
    float ys1 = pendulumSave.pendulums.get(i).get(1);
    float xs2 = pendulumSave.pendulums.get(i).get(2);
    float ys2 = pendulumSave.pendulums.get(i).get(3);
    float r = pendulumSave.pendulums.get(i).get(4);
    float g = pendulumSave.pendulums.get(i).get(5);
    float b = pendulumSave.pendulums.get(i).get(6);
    float t = pendulumSave.pendulums.get(i).get(7);
    
    stroke(r, g, b, t );
    line(0, 0, xs1, ys1 );
    line(xs1, ys1, xs2, ys2);
  }

  pendulumSave.decT();
  //pendulumSave.printPendulums();

  pendulum.updatePoints(0.1); //dt
}
