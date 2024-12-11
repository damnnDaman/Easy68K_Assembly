*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
HARDWARE EQU $E00000
LEDS    EQU $10
BUTTONS EQU $14
SWITCHES EQU $12  

 ORG    $1000
START:                  ; first instruction of program
    
    MOVE    #32,D0          ;task 32
    CLR.L   D1              ;display hardware window
    TRAP    #15             ;system call
    
    LEA HARDWARE,A1
    CLR.B  LEDS(A1)     ;TURNING OFF LEDS
    

* Put program code here

POLLING_LOOP:
    MOVE.B SWITCHES(A1),D2
    MOVE.B BUTTONS(A1),D1
    
    
    CMP.B  #%01111111,D1
    BEQ    CHANGE_LED
    BRA    POLLING_LOOP    


CHANGE_LED:
    MOVE.B D2,LEDS(A1)
    BRA POLLING_LOOP
    
SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
