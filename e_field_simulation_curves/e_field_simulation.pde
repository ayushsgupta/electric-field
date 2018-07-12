PointCharge p1;
PointCharge n1;
FieldLine f1, f2, f3, f4, f5, f6, f7, f8;
TestCharge t;

void setup() {
  size(900, 900);
  background(255);
  p1 = new PointCharge(250, 250, 5e-6);
  n1 = new PointCharge(500, 500, -1e-5);
  PointCharge[] charges = {p1, n1};
//  t = new TestCharge(charges);
  f1 = new FieldLine(p1.getX(), p1.getY(), charges, 1);
  f2 = new FieldLine(p1.getX(), p1.getY(), charges, 2);
  f3 = new FieldLine(p1.getX(), p1.getY(), charges, 3);
  f4 = new FieldLine(p1.getX(), p1.getY(), charges, 4);
  f5 = new FieldLine(p1.getX(), p1.getY(), charges, 5);
  f6 = new FieldLine(p1.getX(), p1.getY(), charges, 6);
  f7 = new FieldLine(p1.getX(), p1.getY(), charges, 7);
  f8 = new FieldLine(p1.getX(), p1.getY(), charges, 8);
}

void draw() {
  background(255);
  //p1.updateLocation((int)mouseX, (int)mouseY);
 // e.update();
 // t.update();
  f1.update(p1);
  f2.update(p1);
  f3.update(p1);
  f4.update(p1);
  f5.update(p1);
  f6.update(p1);
  f7.update(p1);
  f8.update(p1);
  display();
}

void display() {
//  e.display();
  p1.display();
  //p2.display();
  //p3.display();
  //p4.display();
  n1.display();
  //t.display();
  f1.display(n1);
  f2.display(n1);
  f3.display(n1);
  f4.display(n1);
  f5.display(n1);
  f6.display(n1);
  f7.display(n1);
  f8.display(n1);
}