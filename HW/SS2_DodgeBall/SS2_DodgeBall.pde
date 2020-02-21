//DodgeBall By:Giancarlo Macias



import processing.sound.*;
SoundFile song1;
SoundFile song2;
SoundFile song3;

//---------------------------------------------Variables
float movingX =500;
float movingY =500;
float movingX2 =100;
float movingY2 =100;
int directionX =30;
int directionY =30;
int directionX2 =30;
int directionY2 =30;
PImage img;
boolean uRdead=false;
float back1 =random(0,255);
float back2 =random(0,255);
float back3 =random(0,255);
float back11=random(0,255);
float back22=random(0,255);
float back33=random(0,255);
float you1=random(0,255);
float you2=random(0,255);
float you3=random(0,255);
float it1=random(0,255);
float it2=random(0,255);
float it3=random(0,255);
boolean start = false;
int score=frameCount;
int Fscore;


//--------------------------------------------------------------------------------


void setup(){
  
img= loadImage("died.jpg");
size (1080, 720);

song1 = new SoundFile(this, "jevil.mp3");
song2 = new SoundFile(this, "Pac.mp3");
song3 = new SoundFile(this, "Kaard.mp3");
 

}



void draw(){
  
  
if(!song3.isPlaying()){ 
        song3.play();
    } 
background(200,20,200);


textSize(60);
text("DodgeBall", width/2-120, 60); 
text("By Giancarlo Macias", 270, 130); 
text("Click to Start", height/2, width/2+50); 
text("Current High Score: 5,275", 200, 400); 


//--------------------------------------------Game Start----------------------
if (mousePressed==true){
  start=true;}
  
  if (start==true){
 
  frameCount = frameCount+1;  
  score=frameCount;
  
  println ("score "+score);
  
  
song3.stop();
if(!song1.isPlaying()){ 
        song1.play();}
background(back1,back2,back3);
movingX=movingX+directionX;
movingY=movingY+directionY; 

textSize(60);
text("Score "+frameCount, 10, 60);


noStroke();
fill(you1,you2,you3);
circle(mouseX,mouseY,90);                      //This is you
fill(it1,it2,it3);
circle(movingX,movingY,80);                    //This is the obstacle
  
if(movingX>1080 || movingX<0)
  {directionX=directionX*-1;}
if(movingY>720 || movingY<0)
  {directionY=directionY*-1;}
  
  if(frameCount>2400){
    back1 =back11;
    back2 =back22;
    back3 =back33;
    fill(random(255),random(255),random(255));
    circle(movingX2,movingY2,80);
    movingX2=movingX+directionX2;
    movingY2=movingY2+directionY2; 
    if(movingX2>1080 || movingX2<0)
  {directionX2=directionX2*-1;}
if(movingY2>720 || movingY2<0)
  {directionY2=directionY2*-1;}
  }
  
  
  if(frameCount>200){
if(dist(mouseX,mouseY,movingX,movingY)<50){      //when you collide, you die
  uRdead=true;    }}
  
  //--------------------------------------------------//when you collide, you die2
  if(frameCount>2600){                                    
  if(dist(mouseX,mouseY,movingX2,movingY2)<50){      
  uRdead=true;    }
  }
    
if (uRdead==true){                        //this part makes sure you stay dead
    image(img, 0, 0,1080,720);
    movingX=mouseX;
    movingY=mouseY;;
    song1.stop();
      if(!song2.isPlaying()){ 
        song2.play();
        } 
    Fscore=score;
        textSize(60);
        text("Score "+Fscore, 10, 60);
        looping =  !looping;
    
    
  
}
  }
  
  else{
    frameCount=0;}
}
