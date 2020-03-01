// VisualArray By: Giancarlo Macias


int [] numbas= {30,40,99,47,20,76,66,96};  

int index=0; //tracking position in array
int xx = 170;


void setup() {
  size(1900, 900);
  textAlign(CENTER, CENTER);
}


void draw() {
  
  background (0);
  fill(200,255,1);
   textSize(80);
  text("This is what an array looks like in action.",width/2,100);
  textSize(100);
  fill(0,255,255);
  text("[30],[40],[99],[47],[20],[76],[66],[96]",width/2, height/2);
  //text("
  stroke(255,20,0);
  strokeWeight(12);
  noFill();
  circle(xx,height/2,200);
  if(index>7){
    DoItAgain();
    
    if(xx>1800){
      comeBack();
    }
    
  }

   fill(0,255,50);
    text("Index: "+index+"      Value: "+numbas[index]+   "     Objects: 8",width/2,800);
    
}

 void mousePressed(){
   
   println("Index: "+index+"   Value: "+numbas[index]+"Objects: 8");
   xx=xx+220;
   index++;
   
 }
 
 void comeBack(){
 xx=170;
 }
  
  void DoItAgain(){
  index=0;
  }
