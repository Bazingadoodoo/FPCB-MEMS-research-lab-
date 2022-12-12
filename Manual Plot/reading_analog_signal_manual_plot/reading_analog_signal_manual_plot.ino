#include <ADC.h>

int PSD_pin = A1;                       // pin number for PSD input signals
int PSD_val = 0;                        // initialzing PSD input value      
// int TOF_pin = A1;                    // pin number for TOF input signals
// int TOF_val = 0;                     // initialzing TOF input value
int time;

ADC *adc = new ADC();

void setup() 
{
  Serial.begin(38400);
  adc->adc1->setAveraging(16);
  adc->adc1->setResolution(16);
  adc->adc1->setConversionSpeed(ADC_CONVERSION_SPEED::VERY_HIGH_SPEED);
  adc->adc1->setSamplingSpeed(ADC_SAMPLING_SPEED::VERY_HIGH_SPEED);
  while(!Serial);
}

void loop() 
{
  //long int t1 = micros();            // time test
    
  PSD_val = analogRead(PSD_pin);        // reading psd
  // TOF_val = analogRead(TOF_pin);     // reading TOF
  
  //version 1
  SerialUSB.println(PSD_val);                // time interval (plotting)

  //version 2
  //time = millis()/10;
  //SerialUSB.print(PSD_val);                // time interval (plotting)
  //SerialUSB.print(" ");
  //SerialUSB.println(time);
  
  //long int t2 = micros();            // time test
  //SerialUSB.println(t2-t1);
}
