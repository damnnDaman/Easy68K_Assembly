*-----------------------------------------------------------
* Title      :QUESTION 3 
* Written by :DAMAN KUMAR
* Date       :2024-10-04
* Student ID :1306900 
* Section    : 0105
*-----------------------------------------------------------

* I have exclusive control over this submission via my password.
* By including this statement in this header, I certify that
* I have read and understood the University policy in academic
* integrity and I assert that this work is my own. I have
* not used any unapproved external resources including LLM
* models. Furthermore, I certify that is assignment was
* prepared by me specifically for this course.


    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    MOVE.B NUM,D0       ;load %1000 into D0 in hexadecimal(8)
    MOVE.B SHIFT,D1     ;load number of shifts to D1
    LSL.B D1,D0         ;left shift on D0 by D1(number of shift)
    MOVE.B D0,$9003     ;D0 got 10(in hex) and then store it at address $9003
    

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $9000

NUM DC.B %1000          ;define constant NUM by a byte size
SHIFT DC.B 1            ;number of shifts, 1 means 1 byte

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
