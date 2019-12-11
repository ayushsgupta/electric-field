class FieldLine {
  int x, y;
  float tan_theta;
  float r;
  public static final float COULOMB = 9.0e9;
  
  FieldLine(int x, int y) {
    this.x = x;
    this.y = y;
    tan_theta = 0;
    r = 15;
  }
  
  void update(PointCharge[] charges) {
    float ex = 0;
    float ey = 0;
    
    for(PointCharge c: charges) {
      float enx = COULOMB * abs(c.getCharge()) * (abs(c.getX() - x) / distance(x, y, c.getX(), c.getY())) / pow(distance(x, y, c.getX(), c.getY()), 2);  
      float eny = COULOMB * abs(c.getCharge()) * (abs(c.getY() - y) / distance(x, y, c.getX(), c.getY())) / pow(distance(x, y, c.getX(), c.getY()), 2);  
      
      if (c.getCharge() > 0) {
        if (c.getX() > x) ex -= enx;
        else ex += enx;
 
        if (c.getY() > y) ey -= eny;
        else ey += eny;
      } 
      else if (c.getCharge() < 0) {
        if (c.getX() > x) ex += enx;
        else ex -= enx;
 
        if (c.getY() > y) ey += eny;
        else ey -= eny;
      }
    }
    
    tan_theta = ey / ex;
  }
  
  void display() {
    stroke(0);
    fill(0);
    
    float diff_x = (pow((r * r / (1 + tan_theta * tan_theta)), 0.5));
    float diff_y = (pow((r * r / (1 + 1 / (tan_theta * tan_theta))), 0.5));
    if (tan_theta < 0) diff_y *= -1;
    
    line(x - diff_x, y - diff_y, x + diff_x, y + diff_y);
    //ellipse(x + diff_x, y + diff_y, 1, 1);
  }
  
  float distance(int x1, int y1, int x2, int y2) {
    return pow(((float)pow(x2 - x1, 2) + (float)pow(y2 - y1, 2)), 0.5);
  }
  
}
