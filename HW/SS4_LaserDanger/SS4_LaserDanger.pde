//Laser Danger By Giancarlo Macias

import processing.sound.*;
SoundFile song1;
SoundFile song2;
PImage you1;
PImage you2;
PImage you3;
PImage you4;
//boolean restart=false;
int health=3;


void setup() {
  //size(1700,1050);
  size(1700,900);
  song1 = new SoundFile(this, "song1.mp3");
  song2 = new SoundFile(this, "song2.mp3");
  song1.play();
  you1= loadImage("good.png");
  you2= loadImage("eh.png");
  you3= loadImage("bad.png");
  you4= loadImage("die.png");
  
  
  
}






void draw(){
  
  
background(100);
imageMode(CENTER);
int score=frameCount;
fill(255);
textSize(100);
text("Health: "+health,35,120);
text("Score: "+score,1000,120);
if(health==3){
image(you1,mouseX,700,150,150);
println(frameCount);
}
else if(health==2){
  image(you2,mouseX,700,150,150);}
  
  else if(health==1){
    image(you3,mouseX,700,150,150);}
    
    else{
    image(you4,mouseX,700,150,150);
    song1.stop();
    if(!song2.isPlaying()){ 
        song2.play();}
        
    looping =  !looping;
    }

if (frameCount>200 && frameCount%10==0){
  fill(255,0,0);

rect(random(25,width-25),CENTER,100,1050);
}

color c = get (mouseX,700);
//println(c);

if (c==-65536){
  println ("die");
  health--;
  
 
  }
}
