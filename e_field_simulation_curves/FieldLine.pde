class FieldLine {
  int x, y, pos;
  float tan_theta;
  float r;
  PointCharge[] charges;
  public static final float COULOMB = 9.0e9;
  
  FieldLine(int x, int y, PointCharge[] charges, int pos) {
    this.x = x;
    this.y = y;
    this.pos = pos;
    this.charges = charges;  
    tan_theta = 0;
    r = 10;
  }
  
  void update(PointCharge c) {
    if (pos == 1) {
      this.x = c.getX() + c.getR() / 2; 
      this.y = c.getY() - c.getR() / 2;
    } else if (pos == 2) {
      this.x = c.getX() - c.getR() / 2; 
      this.y = c.getY() - c.getR() / 2;
    } else if (pos == 3) {
      this.x = c.getX() - c.getR() / 2; 
      this.y = c.getY() + c.getR() / 2;
    } else if (pos == 4) {
      this.x = c.getX() + c.getR() / 2; 
      this.y = c.getY() + c.getR() / 2;
    } else if (pos == 5) {
      this.x = c.getX() + c.getR() / 2; 
      this.y = c.getY();
    } else if (pos == 6) {
      this.x = c.getX(); 
      this.y = c.getY() - c.getR() / 2;
    } else if (pos == 7) {
      this.x = c.getX() - c.getR() / 2; 
      this.y = c.getY();
    } else if (pos == 8) {
      this.x = c.getX(); 
      this.y = c.getY() + c.getR() / 2;
    }
  }
  
  float[] calculate(PointCharge[] charges, float xx, float yy) {
    float ex = 0;
    float ey = 0;
    
    for(PointCharge c: charges) {
      float enx = COULOMB * abs(c.getCharge()) * (abs(c.getX() - xx) / distance(xx, yy, c.getX(), c.getY())) / pow(distance(xx, yy, c.getX(), c.getY()), 2);  
      float eny = COULOMB * abs(c.getCharge()) * (abs(c.getY() - yy) / distance(xx, yy, c.getX(), c.getY())) / pow(distance(xx, yy, c.getX(), c.getY()), 2);  
      
      if (c.getCharge() > 0) {
        if (c.getX() > xx) ex -= enx;
        else ex += enx;
 
        if (c.getY() > yy) ey -= eny;
        else ey += eny;
      } 
      else if (c.getCharge() < 0) {
        if (c.getX() > xx) ex += enx;
        else ex -= enx;
 
        if (c.getY() > yy) ey += eny;
        else ey -= eny;
      }
    }
    
    float[] ret = {ey, ex};
    return ret;
  }
  
  void display(PointCharge n) {
    stroke(0);
    fill(0);
    
    float xo = x;
    float yo = y;
    
    boolean flag = true;
    int counter = 0;
    
    while (flag) {
      float[] ret = calculate(charges, xo, yo);
      float xf = xo + 0.05 * ret[1];
      float yf = yo + 0.05 * ret[0];
      print(ret[1] + '\t');
      println(ret[0]);
      line(xo, yo, xf, yf);
      xo = xf;
      yo = yf;
      counter++;
      
      if (abs(n.getX() - xf) < n.getR() && abs(n.getY() - yf) < n.getR()) flag = false;
      if (counter > 10000) flag = false;
    }
    
    /*
    
    float diff_x = (pow((r * r / (1 + tan_theta * tan_theta)), 0.5));
    float diff_y = (pow((r * r / (1 + 1 / (tan_theta * tan_theta))), 0.5));
    if (tan_theta < 0) diff_y *= -1;
    
    line(x - diff_x, y - diff_y, x + diff_x, y + diff_y);
    //ellipse(x + diff_x, y + diff_y, 2, 2);*/
  }
  
  float distance(int x1, int y1, int x2, int y2) {
    return pow(((float)pow(x2 - x1, 2) + (float)pow(y2 - y1, 2)), 0.5);
  }
  
  float distance(float x1, float y1, float x2, float y2) {
    return pow(((float)pow(x2 - x1, 2) + (float)pow(y2 - y1, 2)), 0.5);
  }
  
}