import grafica.*;
import processing.serial.*;

Serial myPort;
float inByte;         // Incoming serial data (floating pt)
String inString;      // incoming serial data (string)
String [] token;
int i, x, y;
GPlot myplot1;

void setup ()
{
  size(1600, 760);                                 // set the window size:
  
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Initiliaze Serial Port
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  myPort = new Serial(this, "COM3", 38400);  
  myPort.bufferUntil('\n'); 
  
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Set Up PLot
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  //
  myplot1 = new GPlot(this);
  myplot1.setPos(0,0);
  myplot1.setDim(1500,660);
  myplot1.getTitle().setText("PSD Readings");
  myplot1.getXAxis().getAxisLabel().setText("Time(ms)");
  myplot1.getYAxis().getAxisLabel().setText("PSD Sensor Reading (amplified)");
}

void draw()
{
  background(0);
  while (myPort.available()>0)
  {
    inString = myPort.readStringUntil('\n');
    if (inString != null)
    {
      //print(inString);                //check
      token = splitTokens(inString);
      //for (i=0; i<token.length; i++)  //check
      //{                               //check
      //  print(">>");                  //check
      //  println(token[i]);            //check
      //}                               //check
      x = int(token[1]);
      //println(x);                     //check
      y = int(token[0]);            
      //println(x);                     //check
      myplot1.addPoint(x,y);
    }
  }
/*  myplot1.beginDraw();
  myplot1.drawBackground();
  myplot1.drawBox();
  myplot1.drawXAxis();
  myplot1.drawYAxis();
  myplot1.drawTitle();
  myplot1.drawGridLines(GPlot.BOTH);
  myplot1.drawPoints();
  myplot1.endDraw();  */
  myplot1.defaultDraw();
}
