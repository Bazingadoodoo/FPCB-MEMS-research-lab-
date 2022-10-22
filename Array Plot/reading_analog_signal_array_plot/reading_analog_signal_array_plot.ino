#include "reading_analog_signal_array_plot.h"

/*
// setting sampling rate to 77kHz
#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

sbi(ADCSRA,ADPS2) ;
cbi(ADCSRA,ADPS1) ;
cbi(ADCSRA,ADPS0) ;
*/

// actual program -------------------------------------------------------------------------------------------------------------
int PSD_pin = A1;                       // pin number for PSD input signals
int PSD_val = 0;                        // initialzing PSD input value      
// int TOF_pin = A1;                    // pin number for TOF input signals
// int TOF_val = 0;                     // initialzing TOF input value

const int data_points = 20;
int PSD_val_arr[data_points];

void setup() {
  Serial.begin(9600);
  while(!Serial);
}

void loop() {
  
  //analogReadResolution(16);          // bit resolution 
  
  //long int t1 = micros();            // time test
  
  for (int i=0; i<data_points; i++)
  {  
    PSD_val_arr[i] = analogRead(PSD_pin);   // reading psd and setting data as an array
  }
  
  //long int t2 = micros();            // time test 
  //Serial.print(t2-t1);               // time test
  //Serial.println(" micro seconds");  // time test

  for (int i=0; i<data_points; i++)
  {
    Serial.println(PSD_val_arr[i]);          // PSD results
  }
  
  
}
