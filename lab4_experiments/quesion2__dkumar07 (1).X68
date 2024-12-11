*-----------------------------------------------------------
* Title      :QUESTION 2 
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
    MOVE.W DIVIDEND,D2
    EXT.L D2            ;extending sign
    MOVE.W DIVISOR,D3
    EXT.L D3            ;DIVS only divide long size bits
    DIVS D3,D2  
    MOVE.W D2, $9004    ;Storing quotient
    SWAP D2             ;swapped last 4 bits with first 4 bits
    MOVE.W D2, $9006    ;storing remainder
    CLR D2
    CLR D3

    

    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $9000
DIVIDEND DC.W 8
DIVISOR  DC.W -2

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
