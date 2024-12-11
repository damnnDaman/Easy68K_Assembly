*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
   
LED_HARDWARE EQU $E00010
PUSH_BUTTONS EQU $4 

 ORG    $1000
START:                  ; first instruction of program

    MOVE    #32,D0          ;task 32
    CLR.L   D1              ;display hardware window
    TRAP    #15             ;system call
    LEA     LED_HARDWARE,A1 ;STORING LEDS ADDRESS IN A1 FOR OFFSET USE

LOOP:
    MOVE.B PUSH_BUTTONS(A1),D1
    NOT.B  D1
    MOVE.B D1,LED_HARDWARE
    BRA    LOOP
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source2
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
