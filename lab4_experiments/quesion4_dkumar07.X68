*-----------------------------------------------------------
* Title      : Question 4
* Written by :Daman Kumar
* Date       :2024-10-04
* Description:
*-----------------------------------------------------------
BIN EQU $E00010  
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    AND.B #$00, BIN    ;BIN IS ALL ZERO NOW
    OR.B #$81,BIN     ;BIN2 WILL BE 10000001
    NOT BIN            ; its opposite of before
    NOT BIN             ; reset
    EOR.B #%11111111, BIN ;turning all the middle ones ON

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
