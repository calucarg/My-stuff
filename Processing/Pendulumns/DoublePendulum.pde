class DoublePendulum {
  float G = -9.82;
  AttachedMass pendulum1, pendulum2;

  class AttachedMass {
    float mass; //masa
    float length; //longitud
    float theta; //angulo
    float thetadot; //velocidad angular

    AttachedMass(float mass, float length, float theta, float thetadot) {
      this.mass = mass;
      this.length = length;
      this.theta = theta;
      this.thetadot = thetadot;
    }
  }

  DoublePendulum(float mass1, float length1, float theta1, float thetadot1,
    float mass2, float length2, float theta2, float thetadot2) {
    pendulum1 = new AttachedMass(mass1, length1, theta1, thetadot1);
    pendulum2 = new AttachedMass(mass2, length2, theta2, thetadot2);
  }

  void updatePoints(float dt) { //Δt
    pendulum1.theta += pendulum1.thetadot * dt;
    pendulum2.theta += pendulum2.thetadot * dt;

    float a = (pendulum2.mass * pendulum2.length) / ((pendulum1.mass + pendulum2.mass) * pendulum1.length) * cos(pendulum1.theta - pendulum2.theta);
    float b = pendulum1.length / pendulum2.length * cos(pendulum1.theta - pendulum2.theta);
    float c = -(pendulum2.mass * pendulum2.length) / ((pendulum1.mass +pendulum2.mass) * pendulum1.length) * (pendulum2.thetadot * pendulum2.thetadot) * sin(pendulum1.theta - pendulum2.theta) - G * sin(pendulum1.theta) / pendulum1.length;
    float d = (pendulum1.length * (pendulum1.thetadot * pendulum1.thetadot) * sin(pendulum1.theta - pendulum2.theta) - G * sin(pendulum2.theta)) / pendulum2.length;
    pendulum1.thetadot += (c - a * d) / (1 - a * b) * dt;
    pendulum2.thetadot += (d - b * c) / (1 - a * b) * dt;
  }

  public PVector getCoord(AttachedMass massPoint) {
    return new PVector(massPoint.length * sin(massPoint.theta), -massPoint.length * cos(massPoint.theta));
  }

  public float[] getXs() {
    float[] xs = {0, pendulum1.length * sin(pendulum1.theta),
      pendulum1.length * sin(pendulum1.theta) + pendulum2.length * sin(pendulum2.theta)};
    return xs;
  }
  public float[] getYs() {
    float[] ys = {0, -pendulum1.length * cos(pendulum1.theta),
      -pendulum1.length * cos(pendulum1.theta) - pendulum2.length * cos(pendulum2.theta)};
    return ys;
  }

  public float K() {
    float m1 = pendulum1.mass;
    float m2 = pendulum2.mass;
    float l1 = pendulum1.length;
    float l2 = pendulum2.length;
    float theta1 = pendulum1.theta;
    float theta2 = pendulum2.theta;
    float thetadot1 = pendulum1.thetadot;
    float thetadot2 = pendulum2.thetadot;
    return 0.5 * m1 * pow(l1 * thetadot1, 2) + 0.5 * m2 * (pow(l1 * thetadot1, 2) + pow(l2 * thetadot2, 2) +
      2 * l1 * l2 * thetadot1 * thetadot2 * cos(theta1 - theta2));
  }

  public float U() {
    float m1 = pendulum1.mass;
    float m2 = pendulum2.mass;
    float l1 = pendulum1.length;
    float l2 = pendulum2.length;
    float theta1 = pendulum1.theta;
    float theta2 = pendulum2.theta;
    return -G * ((m1 + m2) * l1 * cos(theta1) + m2 * l2 * cos(theta2));
  }
}
