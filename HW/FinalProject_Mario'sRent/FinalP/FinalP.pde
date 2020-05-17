// Giancarlo Macias
// Mario's Rent

// Instructions: Collect the coins as fast as you can to pay your rent. 
// Twist potentiometer to go right or left, tap photocell to jump.



import processing.serial.*; //imports Serial library from Processing
  
import processing.sound.*;
SoundFile song;
SoundFile die;


Serial myPort; // creates object from Serial class
int val=0;   // crap getting spit out from arduino
int val1=0; 
int val2=0;
float CoinRandoX = 400;
float CoinY= 200;
float urX = 20;
float urY = 600;
int coins=0;
int begin; 
int duration = 30;
int time = 0;
int months =0;





void setup() {
  size(1500, 900);
  /*
   IMPORTANT: We must tell Processing which port to read from.
   Run the sketch and check your console to see the results of printArray(Serial.list());
   and that is how you know the port to use.
   On my Mac, it is port 1 and so I open Serial.list()[1].
   */

  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[0]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
  
  
  begin = millis();  
  
  die = new SoundFile(this, "die.wav");
  song = new SoundFile(this, "song.mp3");
  song.play();

  
}

void draw() {
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val1

  }

  //draws an ellipse that grows and shrinks in relation to val
  background(100);
  fill(30,0,0);
  
  
    time = duration - (millis() - begin)/1000;
    text("Month: "+months,600,50);
    text("8 Coin Rent due in: "+time, width-500, 50);
    
    
  
  
  urX=25+(val1*9.36);
  
  rectMode(LEFT);
  rect(0,height-200,width,1000);
  fill(255,255,0);
  circle(CoinRandoX,200,50);
  fill(10,50,255);
  rectMode(CENTER);
  square(urX,urY,50);
  fill (0);
  fill(255);
  textSize(40);
  text("Coins: "+coins,10,50);
  
 
 if(time<0 && coins >=8){
     coins=coins-8;
     months++;
     duration=duration+30-(months*3);
    }
    
    
    else if (time<0 && coins<8){
   println("die"); 
   fill(0);
   circle(500,500,5000);
   fill(255,20,0);
   text("You got evicted, lost your job, and died",370,height/2);
   song.stop();
   if(!die.isPlaying()){ 
        die.play();   
        
}

   
  }
 
 
 
 if (val>=0 && val<=155){
   val1=val;
 
 }
   
   if (val>=156 && val <=255){
     val2=val;
   
 }
 
  if(dist(urX, urY,CoinRandoX,CoinY)<50){
    CoinRandoX=random(50,width-50);
    coins++;
    
  }

  if (val2<220){
   urY=200; 
   
  }
  else urY=height-225;
  
  println("twist  "+val1);
  println("light  "+val2);
  }
  
  
