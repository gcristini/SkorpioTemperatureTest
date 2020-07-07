/*
 
  
  
  */

/* **************************************** */
/* *********** GLOBAL VARIABLES *********** */
/* **************************************** */
String inputCommand = "";     // a String to hold incoming data
bool stringComplete = false;  // whether the string is complete
char cmd [10];
int cmdIndex;

/* **************************************** */
/* **************** SETUP ***************** */
/* **************************************** */
void setup() 
{
  /* initialize serial: */
  Serial.begin(115200);
  /* reserve 200 bytes for the inputString: */
  inputCommand.reserve(200);
}


/* **************************************** */
/* ***************** MAIN ***************** */
/* **************************************** */
void loop() 
{

  
  if (Serial.available() == 1)
  {    
    
  inputCommand = Serial.readStringUntil('\n');
  parseCommand (inputCommand);
  
  }
  
}


void parseCommand(String command)
{
   
  
  if (command=="read_temp")
  {
    Serial.println("temperatura");
  }
  else
  {
    Serial.println("nack");
  }
  
}

/* **************************************** */
/* ************** INTERRUPTS ************** */
/* **************************************** */
void serialEvent() 
{
  
      
}
