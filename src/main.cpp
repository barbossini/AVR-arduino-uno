#include <Arduino.h>

// put function declarations here:
#define LRED 12
#define LGREEN 11
#define LBLUE 10

#define SRED 4
#define SGREEN 3
#define SBLUE 2

void setup() {
  // put your setup code here, to run once:
  pinMode(LRED,OUTPUT);
  pinMode(LGREEN,OUTPUT);
  pinMode(LBLUE,OUTPUT);

  digitalWrite(LRED,HIGH);
  digitalWrite(LGREEN,HIGH);
  digitalWrite(LBLUE,HIGH);

  pinMode(SRED,INPUT);
  pinMode(SGREEN,INPUT);
  pinMode(SBLUE,INPUT);
    delay(2000);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(SRED) == HIGH) digitalWrite(LRED,LOW);
  if(digitalRead(SGREEN) == HIGH) digitalWrite(LGREEN,LOW);
  if(digitalRead(SBLUE) == HIGH) digitalWrite(LBLUE,LOW);

  delay(100);
  digitalWrite(LRED,HIGH);
  digitalWrite(LGREEN,HIGH);
  digitalWrite(LBLUE,HIGH);
}