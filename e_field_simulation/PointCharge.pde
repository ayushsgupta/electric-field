class PointCharge {
  int x, y, size;
  float charge;
  
  PointCharge(int x, int y, float charge) {
    this.x = x;
    this.y = y;
    this.charge = charge;
  }
  
  void display() {
    if (charge > 0) {
      fill(255, 0, 0); 
      stroke(255, 0, 0);
    }
    else {
      fill(0, 171, 255);
      stroke(0, 171, 255);
    }
    ellipse(x, y, 20, 20);
  }
  
  float getCharge() {
    return charge;
  }
  
  int getX() {
    return x;  
  }
  
  int getY() {
    return y;  
  }
  
  void updateLocation(int x, int y) {
    this.x = x;
    this.y = y;
  }
}