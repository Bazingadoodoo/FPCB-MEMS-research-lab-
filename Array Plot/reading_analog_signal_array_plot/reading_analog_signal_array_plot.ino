#include <ADC.h>
#include <ADC_util.h>

/*
notes on possible soltions to try out:
 - adc set functions (ADC library => include ADC.h) (ADC->ADC1->set...)
 - serialUSB.write (...very high speed)
*/

// actual program -------------------------------------------------------------------------------------------------------------
int PSD_pin = A1;                       // pin number for PSD input signals
int PSD_val = 0;                        // initialzing PSD input value      
// int TOF_pin = A1;                    // pin number for TOF input signals
// int TOF_val = 0;                     // initialzing TOF input value
ADC *adc = new ADC();

const int data_points = 20;
int PSD_val_arr[data_points];

void setup() {
  Serial.begin(38400);
  while(!Serial);
  adc->adc1->setConversionSpeed(ADC_CONVERSION_SPEED::VERY_HIGH_SPEED);
  adc->adc1->setSamplingSpeed(ADC_SAMPLING_SPEED::VERY_HIGH_SPEED);
}

void loop() {
  
  //long int t1 = micros();            // time test
  
  /*
  for (int i=0; i<data_points; i++)
  {  
    PSD_val_arr[i] = analogRead(PSD_pin);   // reading psd and setting data as an array
  }
  */
  
  float X = analogRead(PSD_pin);
  Serial.println(X);

  //long int t2 = micros();            // time test 
  //Serial.print(t2-t1);               // time test
  //Serial.println(" micro seconds");  // time test

  /*
  for (int i=0; i<data_points; i++)
  {
    Serial.println(PSD_val_arr[i]);          // PSD results
  }
  */
  
}
