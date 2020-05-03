//Receives data over Serial port from Processing to control 1 LED fade
//Hook up LED to PWM pin 10.


byte val; // stores data received from serial port
//const int LED = 10; // variable for which pin


void setup() {
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
   pinMode(11, OUTPUT);
   // set pin as output
  Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {

  if (Serial.available()) { // If data is available to read
    val = Serial.read(); // read it and store it in val
  }
 if(val>=0 && val<= 63){
    analogWrite(9, 255);
    analogWrite(10, 0);
    analogWrite(11, 0);
 }
 else if(val>63 && val<=127){
  analogWrite(9, 0);
    analogWrite(10, 255);
    analogWrite(11, 0);
 }
 else if (val>127 && val<=190){
  analogWrite(9, 0);
    analogWrite(10, 0);
    analogWrite(11, 255);
 }
 else if(val>190){
  analogWrite(9,random(2)*255);
  analogWrite(10,random(2)*255);
  analogWrite(11,random(2)*255);
  delay(200);
  analogWrite(9, 0);
  analogWrite(10, 0);
  analogWrite(11, 0);
  delay(200);
 
  
 }
 else{}
  }
