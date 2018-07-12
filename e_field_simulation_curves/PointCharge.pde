class PointCharge {
  int x, y, size;
  float charge;
  
  PointCharge(int x, int y, float charge) {
    this.x = x;
    this.y = y;
    this.charge = charge;
    this.size = 20;
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
    ellipse(x, y, size, size);
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
  
  int getR() {
    return size;
  }
  
  void updateLocation(int x, int y) {
    this.x = x;
    this.y = y;
  }
}