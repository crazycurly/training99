#define distance X*X+Y*Y
#include <math.h>

long X ;
long Y;
float angle;
int dir = 8;
int tmp=8;
boolean state = true;
void setup() {
  Serial.begin(9600);
  pinMode(2,INPUT);
  digitalWrite(2,HIGH);
}

void loop() {

  X=analogRead(A0)-512;
  Y=analogRead(A1)-512;
  
  if (distance < 200)
  {
    dir = 8;
  }
  else
  {
    angle = atan2(Y, X) * 180 / M_PI;
    angle = fmod(angle + 180, 360);
    dir = fmod(angle + 22.5, 360) / 45;
  }
  if(tmp!=dir){
    Serial.println(dir);
    tmp=dir;
  }

  if(!digitalRead(2)){
    if(state){
      Serial.println("e");
      state=false;
    }
  }
  else
    state=true;
    
    
  delay(10);
}
