import processing.serial.*;

Serial myPort;        // The serial port
float inByte;         // Incoming serial data
boolean newData = false;
String [] token;
float lastTime = 0;
float lastHeight = 0;
int x_line, y_line;
float x = 0, y;
float screenCounter = 0;

void setup () 
{
  size(1600, 760);                                 // set the window size:
  myPort = new Serial(this, "COM3", 38400);
  myPort.bufferUntil('\n');                        // A serialEvent() is generated when a newline character is received :
  background(255);                                 // set inital background:
  grid();
}

void draw ()
{
  if (newData)
  {
    stroke(127, 34, 255);                                 //stroke color
    strokeWeight(1);                                      //stroke wider
    line(lastTime, lastHeight, x, height - y);    //Drawing a line from Last inByte to the new one.
    lastTime = x;
    lastHeight = height - y;
  }
  newData = false;
}

void grid () 
{
  stroke(209);
  strokeWeight(1);

  x_line = 5;
  y_line = 5;

  while (x_line < width) {              // grids in the x direction, with size of 12 px
    line(x_line, 0, x_line, height);
    x_line = x_line + 16;
  }

  while (y_line < height) {              // grids in the y direction, with size of 12 px
    line(0, y, width, y);
    y = y + 50;
  }
}


void serialEvent (Serial myPort) 
{
  String inString = myPort.readStringUntil('\n');   // get the ASCII string:
  if (inString != null) 
  {
    token = splitTokens(inString);
    if (x <= width)
    {
      x = float(token[1]) - screenCounter*width;
    }
    
    if (x > width)
    {
      background(255);                                 // set inital background:
      grid();
      screenCounter++;
      x = float(token[1]) - screenCounter*width;
    }
    
    y = float(token[0]);
    y = map(y, 0, 1000, 0, height);      //map to the screen height.
    newData = true;
    //print(x);
    //print(" ");
    //println(y);
    println(screenCounter);
  }
}
