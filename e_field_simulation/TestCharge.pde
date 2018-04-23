class TestCharge {
  int x, y;
  float x_comp, y_comp;
  float r;
  public static final float COULOMB = 9.0e9;
  PointCharge[] charges;
  
  TestCharge(PointCharge[] charges) {
    x = 0;
    y = 0;
    x_comp = 0;
    y_comp = 0;
    r = 15;
    this.charges = charges;
  }
  
  void update() {
    x = (int) mouseX;
    y = (int) mouseY;
    
    x_comp = 0;
    y_comp = 0;
    
    for(PointCharge c: charges) {
      float enx = COULOMB * abs(c.getCharge()) * (abs(c.getX() - x) / distance(x, y, c.getX(), c.getY())) / pow(distance(x, y, c.getX(), c.getY()), 2);  
      float eny = COULOMB * abs(c.getCharge()) * (abs(c.getY() - y) / distance(x, y, c.getX(), c.getY())) / pow(distance(x, y, c.getX(), c.getY()), 2);  
      
      if (c.getCharge() > 0) {
        if (c.getX() > x) x_comp -= enx;
        else x_comp += enx;
 
        if (c.getY() > y) y_comp -= eny;
        else y_comp += eny;
      } 
      else if (c.getCharge() < 0) {
        if (c.getX() > x) x_comp += enx;
        else x_comp -= enx;
 
        if (c.getY() > y) y_comp += eny;
        else y_comp -= eny;
      }
    }
    
  }
  
  void display() {
    stroke(0);
    fill(0);
    strokeWeight(4);
    line(x, y, x + r * x_comp, y + r * y_comp);
    ellipse(x, y, 10, 10);
    ellipse(x + r * x_comp, y + r * y_comp, 5, 5);
    strokeWeight(1);
  }

  
  float distance(int x1, int y1, int x2, int y2) {
    return pow(((float)pow(x2 - x1, 2) + (float)pow(y2 - y1, 2)), 0.5);
  }
}