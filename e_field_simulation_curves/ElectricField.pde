class ElectricField {
  PointCharge[] charges;
  FieldLine[][] fieldLines;
  int wi = 30;
/*
  ElectricField(PointCharge[] charges, int w, int h) {
    this.charges = charges;  
    fieldLines = new FieldLine[h / wi][w / wi];
    fillVectors();
  }
  
  void fillVectors() {
    for (int i = 0; i < fieldLines.length; i++) {
      for (int j = 0; j < fieldLines[i].length; j++) {
        fieldLines[i][j] = new FieldLine(j * wi + (wi / 2), i * wi + (wi / 2));    //Cell(j * cell_size, i * cell_size, cell_size, false, c);
      }
    }
  }
  
  void update() {
    for (int i = 0; i < fieldLines.length; i++) {
      for (int j = 0; j < fieldLines[i].length; j++) {
        fieldLines[i][j].update(charges);
      }
    }
  }
  
  void display() {
    for (int i = 0; i < fieldLines.length; i++) {
      for (int j = 0; j < fieldLines[i].length; j++) {      
        fieldLines[i][j].display();
      }
    }
  }
*/
}