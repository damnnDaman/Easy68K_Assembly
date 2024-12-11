*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    MOVE.B email,EMAILU
    SUB.B  #32,EMAILU
    MOVE.B email+1,EMAILU+1
    SUB.B #32, EMAILU+1
    MOVE.B email+2,EMAILU+2
    SUB.B #32, EMAILU+2
    MOVE.B email+3,EMAILU+3
    SUB.B #32, EMAILU+3
    MOVE.B email+4,EMAILU+4
    SUB.B #32, EMAILU+4
    MOVE.B email+5,EMAILU+5
    SUB.B #32, EMAILU+5
    MOVE.B email+6,EMAILU+6
    MOVE.B email+7,EMAILU+7
    MOVE.B email+8,EMAILU+8
    MOVE.B email+9,EMAILU+9
    MOVE.B email+10,EMAILU+10
    MOVE.B email+11,EMAILU+11
    MOVE.B email+12,EMAILU+12
    MOVE.B email+13,EMAILU+13
    MOVE.B email+14,EMAILU+14
    MOVE.B email+15,EMAILU+15
    MOVE.B email+16,EMAILU+16
    MOVE.B email+17,EMAILU+17
    MOVE.B email+18,EMAILU+18
    MOVE.B email+19, EMAILU+19
    
    SIMHALT             ; halt simulator

* Put variables and constants here
    ORG $9000
email DC.B 'dkumar07@uoguelph.ca', 0
    ORG $9040
EMAILU DS.B 20
    


    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
