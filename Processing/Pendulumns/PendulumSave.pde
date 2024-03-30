class PendulumSave {
  ArrayList<ArrayList<Float>> pendulums;

  PendulumSave() {
    pendulums = new ArrayList<ArrayList<Float>>();
  }

  void addPendulum(float xs1, float ys1, float xs2, float ys2, float r, float g, float b, float t) {
    ArrayList<Float> pendulumTemp = new ArrayList<Float>();
    pendulumTemp.add(xs1);
    pendulumTemp.add(ys1);
    pendulumTemp.add(xs2);
    pendulumTemp.add(ys2);
    pendulumTemp.add(r);
    pendulumTemp.add(g);
    pendulumTemp.add(b);
    pendulumTemp.add(t);

    pendulums.add(pendulumTemp);
  }

  void decT() {
    for (int i = 0; i < pendulums.size()-1; i++) {
      float r = pendulums.get(i).get(4);
      float g = pendulums.get(i).get(5);
      float b = pendulums.get(i).get(6);
      float t = pendulums.get(i).get(7);
      if (t <= 0) pendulums.remove(i);
      pendulums.get(i).set(7, t - 3); // transparencia - cantidad a rebajar por iteración
      pendulums.get(i).set(4, (r-(r/pendulums.size())));
    }
  }

  void printPendulums() {
    for (ArrayList<Float> tempList : pendulums) {
      println(tempList+","+pendulums.size());
    }
  }
}
