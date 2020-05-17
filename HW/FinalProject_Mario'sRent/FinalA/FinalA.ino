// DEMO FOR SENDING SERIAL DATA FROM ARDUINO TO PROCESSING
//READS ANALOG SENSOR AND WRITES VALUE TO SERIAL PORT 



const int SENSOR1 = A1; //sensor hooked up to analog pin A0
const int SENSOR2 = A2; //sensor hooked up to analog pin A1
int val1 = 0;
int val2 = 0;

void setup() {
  pinMode (SENSOR1, INPUT);
  pinMode (SENSOR2, INPUT);
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
  val1 = analogRead(SENSOR1); //read sensor and assign to variable called val
  val1 = val1 / 4; //divide val by 4 or remap values to get byte-sized 0-255
  val1=map(val1,0,255,0,155);
  val2 = analogRead(SENSOR2); //read sensor and assign to variable called val
  val2 = val2 / 4; //divide val by 4 or remap values to get byte-sized 0-255
  val2=map(val2,0,255,156,255);
  delay(100); // Wait 100 milliseconds

  /////////Uncomment Serial.print() OR Serial.write() and not both!//////////////
  
  //Serial. println(val1); //to send human-readable data to Arduino monitor
  //Serial. println(val2); //to send human-readable data to Arduino monitor
  Serial.write(val1);  //to send binary data to Processing
  Serial.write(val2);  //to send binary data to Processing
}
