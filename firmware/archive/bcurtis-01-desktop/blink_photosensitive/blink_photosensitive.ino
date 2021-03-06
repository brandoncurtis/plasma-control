void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(13, OUTPUT);     
}

void loop() {
  digitalWrite(13, HIGH);   // set the LED on
  delay(100000/analogRead(0));              // wait for a variable amount of time
  digitalWrite(13, LOW);    // set the LED off
  delay(100000/analogRead(0));              // wait for a variable amount of time
}
