#include <Arduino.h>

// put function declarations here:
extern "C"
{
void start(void);
void led(byte);
}

void setup() {
  // put your setup code here, to run once:
  start();
}

void loop() {
  // put your main code here, to run repeatedly:
  led(1); delay(200);
  led(0); delay(200);
}
