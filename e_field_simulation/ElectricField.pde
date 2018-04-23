class ElectricField {
  PointCharge[] charges;
  FieldLine[][] fieldLines;
  
  ElectricField(PointCharge[] charges, int w, int h) {
    this.charges = charges;  
    fieldLines = new FieldLine[h / 20][w / 20];
    fillVectors();
  }
  
  void fillVectors() {
    for (int i = 0; i < fieldLines.length; i++) {
      for (int j = 0; j < fieldLines[i].length; j++) {
        fieldLines[i][j] = new FieldLine(j * 20 + 10, i * 20 + 10);    //Cell(j * cell_size, i * cell_size, cell_size, false, c);
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

}