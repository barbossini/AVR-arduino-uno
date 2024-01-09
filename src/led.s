;---------------
; Assembly Code
;---------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global start
.global btnLED
;------------------------
start:
;output declaration with DDRB register
    SBI 0x04, 4
    SBI 0x04, 3
    SBI 0x04, 2
;input declaration with DDRD register
    CBI 0x0A, 4 ; 
    CBI 0x0A, 3
    CBI 0x0A, 2
    RET                       ;return to setup() function
;---------------------------------------------------------------------------

btnLED:
    SBIC  0x09, 2             ;skip next statement if red button not pressed
    RJMP  redledON            ;jump to label redledON
    SBIC  0x09, 3             ;skip next statement if green button not pressed
    RJMP  greenledON          ;jump to label greenledON
    SBIC  0x09, 4             ;skip next statement if blue button not pressed
    RJMP  blueledON           ;jump to label blueledON
    RJMP  btnLED              ;return to label btnLED
;-----------------------------------------------------------------------------
redledON:
    LDI   R21, 10             ;initial value of counter R21
redagain:    
    SBI   0x05, 4            ;turn ON red LED
    RCALL myDelay             ;call subroutine myDelay
    CBI   0x05, 4            ;turn OFF red LED
    RCALL myDelay             ;call subroutine myDelay
    SUBI  R21, 1              ;decrement counter by 1
    BRNE  redagain            ;loop if counter not zero
    RJMP  btnLED              ;return to label btnLED
;-----------------------------------------------------------------------------
greenledON:
    LDI   R21, 10             ;initial counter R21 count value
greenagain:    
    SBI   0x05, 3            ;turn ON green LED
    RCALL myDelay             ;call subroutine myDelay
    CBI   0x05, 3            ;turn OFF green LED
    RCALL myDelay             ;call subroutine myDelay
    SUBI  R21, 1              ;decrement counter by 1
    BRNE  greenagain          ;loop if counter not zero
    RJMP  btnLED              ;return to label btnLED
;-----------------------------------------------------------------------------
blueledON:
    LDI   R21, 10             ;initial counter R21 count value
blueagain:    
    SBI   0x05, 2            ;turn ON blue LED
    RCALL myDelay             ;call subroutine myDelay
    CBI   0x05, 2            ;turn OFF blue LED
    RCALL myDelay             ;call subroutine myDelay
    SUBI  R21, 1              ;decrement counter by 1
    BRNE  blueagain           ;loop if counter not zero
    RJMP  btnLED              ;return to label btnLED
;-----------------------------------------------------------------------------
.equ  delayVal, 10000         ;equate delayVal with initial count value
;--------------------         ;for inner loop
myDelay:
    LDI   R20, 90             ;initial count value for outer loop
outerLoop:
    LDI   R30, lo8(delayVal)  ;low byte of delayVal in R30
    LDI   R31, hi8(delayVal)  ;high byte of delayVal in R31
innerLoop:
    SBIW  R30, 1              ;subtract 1 from 16-bit value in R31, R30
    BRNE  innerLoop           ;jump if countVal not equal to 0
    ;--------------
    SUBI  R20, 1              ;subtract 1 from R20
    BRNE  outerLoop           ;jump if R20 not equal to 0
;=============================================================================
;---------------------------------------------------------------------------