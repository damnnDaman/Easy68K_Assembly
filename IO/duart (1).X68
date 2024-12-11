*---------------------------------------------------------------
* Title      : 
* Your Name  : Daman
* Your ID    : 
* Lab Sec    : 
* Date       : YYYY/MM/DD

* I have exclusive control over this submission via my password. 
* By including this statement in this header, I certify that
* I have read and understood the University policy in academic
* integrity and I assert that this work is my own. I have 
* not used any unapproved external resources including LLM 
* models. Furthermore, I certify that is assignment was 
* prepared by me specifically for this course.

*---------------------------------------------------------------
printASCII  EQU     $2D0E
DUART       EQU     $A001
MR1A        EQU     0*2
MR2A        EQU     1*2
SRA         EQU     2*2
CSRA        EQU     3*2
CRA         EQU     4*2
RBA         EQU     5*2

    ORG $2000
INITIALIZE
    INCBIN 'duart_h.BIN'
    ORG     $4000
START:                   ;first instruction of program
    BSR     INITIALIZE
*   YOUR CODE HERE
    MOVEA.L #DUART,A0   ;Initialize pointer to DUART base 

 ; Set up DUART configurations
    MOVE.B #%00000010,MR1A(A0)       ; Mode Register 1: 7 data bits, even parity
    MOVE.B #%00000111,MR2A(A0)       ; Mode Register 2: 1 stop bit
    MOVE.B #%10011001,CSRA(A0)       ; Clock Select Register A: 4800 baud rate
    MOVE.B #%00000101,CRA(A0)        ; Control Register A: Enable transmitter/receiver

POLLING_LOOP
    MOVE.B SRA(A0),D1                ; Load Status Register A into D1
    ANDI.B #$01,D1                   ; Mask to check Receive Ready bit
    BEQ POLLING_LOOP                 ; Keep polling if data is not ready

    MOVE.B RBA(A0),D0                ; Read the received data into D0
    CMPI.B #'0',D0                   ; Compare data with null character
    BEQ TERMINATE                    ; If null, proceed to terminate
    BSR printASCII
    BRA POLLING_LOOP

TERMINATE:
   SIMHALT

    END    START        ;last line of source


























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
