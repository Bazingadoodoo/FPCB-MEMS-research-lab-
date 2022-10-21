int PSD_pin = A1;                       // pin number for PSD input signals
int PSD_val = 0;                        // initialzing PSD input value      
// int TOF_pin = A1;                    // pin number for TOF input signals
// int TOF_val = 0;                     // initialzing TOF input value

const int data_points = 17;
int PSD_val_arr[data_points];

void setup() {
  Serial.begin(38400);
  while(!Serial);
}

void loop() {
   long int t1 = micros();            // time test

  for (int i=0; i<17; i++)
  {
    PSD_val_arr[i] = analogRead(PSD_pin);   // reading psd and setting data as an array
  }

  Serial.println(PSD_val_arr);          // PSD results
  
   long int t2 = micros();            // time test 
   Serial.print(t2-t1);               // time test
   Serial.println(" micro seconds");  // time test
  
  delay(0.706);
}
