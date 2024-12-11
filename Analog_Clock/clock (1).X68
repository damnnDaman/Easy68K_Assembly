* I have exclusive control over this submission via my password.
* By including this statement in this header, I certify that
* I have read and understood the University policy in academic
* integrity and I assert that this work is my own. I have
* not used any unapproved external resources including LLM
* models. Furthermore, I certify that is assignment was
* prepared by me specifically for this course

*-----------------------------------------------------------
* Title      : Assignment4
* Written by : Daman Kumar
* Date       : 27/11/2024
* Description: Writing to digits 1-8 of 7-segment display
*-----------------------------------------------------------

        ORG $2000
* 7-Segment LED patterns for digits 0-7
DIGITS     DC.B    $3F, $06, $5B, $4F, $66, $6D, $7D, $07, $7F, $6F ; 
HH          DC.B  0
MM          DC.B  0
SS          DC.B  0




HARDWARE    EQU     $E00000     ; Base address of hardware devices
DIGIT1      EQU     $0           ; Offset of digit 1 from base
DIGIT2      EQU     $2           ; Offset of digit 2 from base
DIGIT3      EQU     $4           ; Offset of digit 3 from base
DIGIT4      EQU     $6           ; Offset of digit 4 from base
DIGIT5      EQU     $8           ; Offset of digit 5 from base
DIGIT6      EQU     $A          ; Offset of digit 6 from base
DIGIT7      EQU     $C          ; Offset of digit 7 from base
DIGIT8      EQU     $E          ; Offset of digit 8 from base
HYPHEN      EQU     $10          ; Index for hyphen character in DIGITS table
COUNTER     EQU     60           ;COUNTER FOR 60 SECS



            ORG    $8000
START:      
            MOVE.L  #ISR6,$78        ; Set ISR6 vector
            MOVE.L  #ISR7,$7C         ; Set ISR7 vector


POOLING_LOOP

* Prologue: Display hardware window from software
    MOVE.L  #32,D0           ;task number 32
    CLR.B   D1               ;parameter: display window
    TRAP    #15              ;system call
           

    LEA    DIGITS, A1
    LEA    HARDWARE,A0
    
    MOVE.B   #$40,DIGIT3(A0)
    MOVE.B   #$40,DIGIT6(A0)
    
    ;CONVERT HH TO BCD
    CLR.L   D0
    MOVE.B  HH, D0
    DIVS    #10,D0          ;remainder ges displayed
    MOVE.B   (A1,D0),DIGIT1(A0)
    SWAP     D0             ;swap since divs stores both remainder and quotient
    MOVE.B   (A1,D0),DIGIT2(A0)

    * converting MM to BCD
    CLR.L    D0
    MOVE.B   MM,D0
    DIVS     #10,D0
    MOVE.B   (A1,D0),DIGIT4(A0)
    SWAP     D0
    MOVE.B   (A1,D0),DIGIT5(A0)



  * CONVERTING SS TO BCD
  CLR.L    D0             
  MOVE.B   SS,D0
  DIVS     #10,D0
  MOVE.B   (A1,D0),DIGIT7(A0)
  SWAP     D0
  MOVE.B   (A1,D0),DIGIT8(A0)           


 BRA     POOLING_LOOP

;SETTING UP THE ISR6
ISR6:           ORI.W   #$0700,SR
                MOVEM.L A1/D0/D1,-(A7)        ;save working registers
                ANDI.W  #$FDFF,SR              ;SETS TO ISR6
                SUBI.B   #1,COUNTER
                CMPI.B   #0,COUNTER
                BEQ SS_LOOP        
                BRA STOP
                

                
* increment second
SS_LOOP        MOVE.B    #60,COUNTER
                ADDI.B    #1,SS
                CMPI.B    #60,SS
                BEQ      MM_LOOP
                BRA      STOP
                
* increment minute
MM_LOOP        ; CLR.L   MM
                MOVE.B  #0,SS
                ADDI.B    #1,MM
                CMPI.B     #60,MM
                BEQ     HH_LOOP
                ;MOVEM.L (A7)+,A1/D0
                ;RTE
                BRA STOP

; Increment hour
HH_LOOP     MOVE.B  #0,MM
            ADDI.B    #1, HH            
            CMPI.B     #24, HH
            BEQ        RESET_TIMER
            BRA         STOP  
                  
RESET_TIMER:
            MOVE.B #0,HH
            MOVE.B #0,MM
            MOVE.B #0,SS
            BRA STOP
            
            
STOP        MOVEM.L (A7)+,A1/D0/D1
            RTE
            

 
 
              ; ISR7 vector location
ISR7:       ORI.W   #$0700,SR          ;set priority level to 7
            MOVEM.L A1/D0/D1,-(A7)     ;save working registers
            ANDI.W  #$FEFF,SR          ;set priority level to 7
            
            MOVE.B  #0,HH 
            MOVE.B  #0,MM
            MOVE.B  #0,SS  
            MOVE.B  #60,COUNTER          
            MOVEM.L (A7)+,A1/D0/D1     ;restore working registers
            RTE                        ;use RTE to return from interrupt



          END START
 
*







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
