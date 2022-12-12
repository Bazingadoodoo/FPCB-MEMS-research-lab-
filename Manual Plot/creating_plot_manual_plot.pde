import processing.serial.*;

Serial myPort;        // The serial port
float inByte;         // Incoming serial data
boolean newData = false;
int xPos = 1;         // horizontal position of the graph 
int lastxPos=1;
int lastheight=0;
int x, y;   


void setup () {
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
    long t1 = millis();
    stroke(127,34,255);                                   //stroke color
    strokeWeight(1);                                      //stroke wider
    line(lastxPos, lastheight, xPos, height - inByte);    //Drawing a line from Last inByte to the new one.
    lastxPos= xPos;
    lastheight = int(height-inByte);

    // at the edge of the window, go back to the beginning:
    if (xPos >= width) 
    {
      xPos = 0;
      lastxPos= 0;
      background(255);      //Clear the screen.
      grid();
    } 
    else 
    {
      xPos = xPos+2;          // increment the horizontal position:
    }
   newData =false;
   long t2 = millis();
   //println(t2-t1);
  }
}


void grid (){
  stroke(209);
  strokeWeight(1);
 
  x = 5;
  y = 5;
  
  while(x<width)                // grids in the x direction, with size of 12 px
  {              
    line(x,0,x,height);
    x = x+16;
  }
  
  while(y<height)               // grids in the y direction, with size of 12 px
  {
    line(0,y,width,y);
    y = y+50;
  }
}

void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');   // get the ASCII string:
  if (inString != null) {
    inString = trim(inString);                      // trim off whitespaces.
    inByte = float(inString);                       // convert to a number.
    inByte = map(inByte, 0, 700, 0, height);      //map to the screen height.
    newData = true; 
    println(inByte);
  }
}
