// Bewildering Shapes BY Giancarlo Macias

void setup() 
{
size(1080, 720);
frameRate(10);
background(100,100,100);
}

void draw() 

{
  
stroke(255,0,0);                                                  //TRIANGLE
strokeWeight(15);
fill(random(90), random(150,255), random(90));
triangle(10,10,300,10,200,300);

stroke(random(200,255),random(255),random(255));                  // ELLIPSE
strokeWeight(130);
fill(random(0,255), random(0,255), random(0,255));
ellipse(560, 350, 550, 550);    

stroke(random(100));                                              //SQUARE
strokeWeight(30);
fill(random(100), random(100), random(150,255));
square(900,590,100);
} 
