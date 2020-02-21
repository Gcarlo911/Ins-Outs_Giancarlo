// Giancarlo Macias Square Loop


void setup() {
  size (1200, 900);
}  

void draw() {
  background (100);
  //int onee=50;
  for (int one = 50; one < width; one+=100) {
    for (int onee = 50; onee < width; onee+=100)
    if (mouseX > one - 50 && mouseX < one + 50 && mouseY > onee - 50 && mouseY < onee +50) {
      fill (49,200,170);
      rect (one, onee, 100,100);
    } else {
      fill (180,150,95);
      rectMode(CENTER);
    rect (one, onee, 100,100);
    }
    
  }
  
}
