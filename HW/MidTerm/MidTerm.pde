//------------------------------------------------Imports----------------------------------------------------------------------------------
import processing.video.*; 
import processing.sound.*;
Movie intro;
Movie end;
SoundFile song1;
SoundFile song2;
SoundFile song3;

//-----------------------------------------------Global Variables--------------------------------------------------------------------------------------------
boolean GameOn= false;
boolean MainMenu=true;
boolean GameOver=false;
float movingX;
float movingY;
int directionX;
int directionY;

//--------------------------------------------------------Void Setup-----------------------------------------------------------------------------------
void setup(){
size(1900,1000);
imageMode(CENTER);
textAlign(CENTER);
intro = new Movie(this, "MainBack.mov");  
end = new Movie(this, "end.mov");  
song1 = new SoundFile(this, "Kaard.mp3");
song2 = new SoundFile(this, "jevil.mp3");
song3 = new SoundFile(this, "endsong.mp3");


}

void movieEvent(Movie intro) {  
  intro.read();
}
void movieEvent2(Movie end){
  end.read();
}
//-------------------------------------------------------------------------Void Draw------------------------------------------------------------------
void draw (){
     if (MainMenu==true){
       
      MainMenu();
    }
    
    if (GameOn==true){
       
      GameOn();
    }
    
    if (GameOver==true){
       
      GameOver();
    }
}

//-----------------------------------------------------------------Main Menu--------------------------------------------------------------------------
void MainMenu(){
//background(200,20,200);

end.stop();
intro.loop();
  image(intro, width/2, height/2,width,height);
textSize(60);
fill(255,255,0);
text("DodgeBall", width/2, 60); 
text("By Giancarlo Macias", width/2, 130); 
text("Click to Start", width/2, height-100); 
text("Current High Score: 5,275", width/2, 400); 

song2.stop();
song3.stop();
if(!song1.isPlaying()){ 
        song1.play();
}
if (mousePressed==true) {
    
//--------------------------Variable setup for GameOn--------- 
  movingX =500;
  movingY =500;
  directionX =20;
  directionY =20;
//------------------------------------------------------------
      MainMenu=false;
      GameOver=false;
      GameOn = true;
    }
    }



//----------------------------------------------------------------Game On---------------------------------------------------------------------------
void GameOn(){
  
  
background(150,150,150);

 song1.stop();
  song3.stop();
if(!song2.isPlaying()){ 
        song2.play();}

//------------------------------You, the player-----------------------
  fill(0,255,20);
  strokeWeight(3);
  circle(mouseX, mouseY,75);     
//------------------------------Enemy Ball 1--------------------------  
  fill(255,20,0);                    
  circle(movingX,movingY,80);      
  movingX=movingX+directionX;
  movingY=movingY+directionY;
  if(movingX>width || movingX<0)
  {directionX=directionX*-1;}
if(movingY>height || movingY<0)
  {directionY=directionY*-1;}
//---------------------------------------------------------  
  
  
  
  if(dist(mouseX,mouseY,movingX,movingY)<50){
    MainMenu=false; 
    GameOn = false;
    GameOver=true;    }}


    
  






//-----------------------------------------------------------------Game Over--------------------------------------------------------------------------
void GameOver(){
  //background(255,0,0);
  end.loop();
  //end.volume(0);
  image(end, width/2, height/2,width,height);
  fill(255,255,0);
  text("Press 'SPACE' to restart", width/2, 600);
  song1.stop();
  song2.stop();
      if(!song3.isPlaying()){ 
        song3.play();
        } 
  if (keyPressed==true) {
  if ( key == ' ' ) {
    
      GameOver=false;
      GameOn=false;
      MainMenu = true;
      
    
    }
    }}
