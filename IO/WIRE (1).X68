*---------------------------------------------------------------
*
* Title      : Toggle
* Date       : Fall 2024
*
*---------------------------------------------------------------


HARDWARE    EQU     $E00000 ;base address of hardware
TOGGLE      EQU     $12     ;address of toggle switches




    ORG    $1000

START:       

    MOVE    #32,D0          ;task 32
    CLR.L   D1              ;display hardware window
    TRAP    #15             ;system call
    
    LEA     HARDWARE,A1     ;load base address of hardware       
    
  
LOOP:
     MOVE.B  TOGGLE(A1),D1   ;read the state of the switches
     MOVE.B  D1,$E00010
     BRA LOOP
    SIMHALT            

    END    START
  




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
