;---------------
; Assembly Code
;---------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global start
;------------------------
start:
    LDI   R20, 0xFF
    OUT   DDRD, R20   ;set port D as o/p
agn:LDI   R20, 0x55
    OUT   PORTD, R20  ;o/p to port D the binary pattern 01010101
    RCALL myDelay     ;delay
    LDI   R20, 0xAA  
    OUT   PORTD, R20  ;o/p to port D the binary pattern 10101010
    RCALL myDelay     ;delay
    RJMP  agn         ;repeat indefinitely
;----------------------------------------------------------------
myDelay:              ;3-level nested loop subroutine
    LDI   R20, 255    ;outer loop counter 
l1: LDI   R21, 255    ;mid loop counter
l2: LDI   R22, 41     ;inner loop counter to give 0.5s delay
l3: DEC   R22         ;decrement inner loop
    BRNE  l3          ;loop if not zero
    DEC   R21         ;decrement mid loop
    BRNE  l2          ;loop if not zero
    DEC   R20         ;decrement outer loop
    BRNE  l1          ;loop if not zero
    RET               ;return to caller
;----------------------------------------------------------------