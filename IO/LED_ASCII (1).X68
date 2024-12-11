*---------------------------------------------------------------
* Title      : LEDs
* Date       : Fall 2024
*---------------------------------------------------------------
HARDWARE    EQU $E00000     ;base address of the hardware devices
LED         EQU $10         ;address of LEDs

    ORG    $1000
START:    
    MOVE    #32,D0          ;task 32
    CLR.L   D1              ;display hardware window
    TRAP    #15             ;system call
    
    LEA     HARDWARE,A1     ;load hardware address
    
LOOP: 
    MOVE    #5, D0          ;TASK NUMBER FOR READING CHAR
    TRAP    #15             ; STORE IT INTO D1.B
    
    CMP.B   #'q', D1
    BEQ     EXIT
    
    MOVE.B  D1,LED(A1)
    
    BRA     LOOP
    
EXIT:    
    MOVE.B  #$0,LED(A1)    ;turn on LEDs            
    
    SIMHALT             
    END    START       




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
