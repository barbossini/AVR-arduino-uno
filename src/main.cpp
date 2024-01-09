#include <Arduino.h>

// put function declarations here:
extern "C"
{
void start(void);
void btnLED();
}

void setup() {
  // put your setup code here, to run once:
  start();
}

void loop() {
  // put your main code here, to run repeatedly:
  btnLED();
}