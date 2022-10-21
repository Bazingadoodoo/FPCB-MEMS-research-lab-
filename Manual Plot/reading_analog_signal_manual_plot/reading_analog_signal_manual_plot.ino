int PSD_pin = A1;                       // pin number for PSD input signals
int PSD_val = 0;                        // initialzing PSD input value      
// int TOF_pin = A1;                    // pin number for TOF input signals
// int TOF_val = 0;                     // initialzing TOF input value

void setup() {
  Serial.begin(38400);
  while(!Serial);
}

void loop() {
  // long int t1 = micros();            // time test
    
  PSD_val = analogRead(PSD_pin);        // reading psd
  // TOF_val = analogRead(TOF_pin);     // reading TOF
  
  Serial.println(PSD_val);              // PSD results
  // Serial.print(TOF_val);             // TOF results
  
  // long int t2 = micros();            // time test 
  // Serial.print(t2-t1);               // time test
  // Serial.println(" micro seconds");  // time test
  
  delay(100);
}
