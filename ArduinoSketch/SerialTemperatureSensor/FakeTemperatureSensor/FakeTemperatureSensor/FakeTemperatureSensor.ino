/*
 
  
  
  */

/* **************************************** */
/* *********** GLOBAL VARIABLES *********** */
/* **************************************** */
String inputCommand = "";     // a String to hold incoming data
int basetime=5; //s
int tempArray[] = {10, 20, 30, 40}; //°C
int tempIndex;
int temp=0;
int startTimer=0;

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
  //startTimer=1; //////
  if (timer_s(basetime))
  { 
    //Serial.write(temp);
    if (tempIndex < 4)
    {       
      temp = tempArray [tempIndex];
      tempIndex++;
    }
    
  }
  
  if (Serial.available() == 1)
  {    
        
  inputCommand = Serial.readStringUntil('\n');
 // Serial.println(inputCommand)
  parseCommand (inputCommand);
  
  }
  
}

int timer_s(int time_s)
{
  static unsigned long t1, dt;
  int ret = 0;
  dt = (millis () - t1)/1000;
  if (dt  >= time_s)
  {
    t1=millis();
    ret = 1;
  }
  return ret;  
}

void parseCommand(String command)
{
  
  if (command == "read_temp")
  {    
    Serial.println(String(temp));
  }
  else
  {
    /* Misra */
  }
  
}
