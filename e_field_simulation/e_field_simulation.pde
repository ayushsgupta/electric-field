PointCharge p1, p2, p3, p4;
PointCharge n1;
ElectricField e;
FieldLine f;
TestCharge t;

void setup() {
  size(800, 800);
  background(255);
  p1 = new PointCharge(225, 225, 5e-6);
  p2 = new PointCharge(225, 575, 5e-6);
  p3 = new PointCharge(575, 225, 5e-6);
  p4 = new PointCharge(575, 575, 5e-6);
  n1 = new PointCharge(575, 575, -5e-6);
  PointCharge[] charges = {p1, n1};
  e = new ElectricField(charges, 800, 800);
  t = new TestCharge(charges);
}

void draw() {
  background(255);
  //n1.updateLocation((int)mouseX, (int)mouseY);
  e.update();
  t.update();
  display();
}

void display() {
  e.display();
  p1.display();
  //p2.display();
  //p3.display();
  //p4.display();
  n1.display();
  t.display();
}