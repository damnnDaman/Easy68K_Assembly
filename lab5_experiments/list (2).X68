*---------------------------------------------------------------
* Title : List
* Date  : Fall 2024
*---------------------------------------------------------------
        
        ORG     $8000
START   LEA     LIST,A0          ;pointer to list
        MOVE    #$7FFF,D0        ;initialize to max word
        MOVE    #$8000,D1        ;D1 is lowest and will update to max 
        MOVE    LENGTH,D3        ;initialize index counter
AGAIN   BEQ     DONE             ;last word? goto DONE
        MOVE    (A0)+,D2         ;load next in list
        CMP     D0,D2            ;compare next with min 
        BGE     CHECKMAX         ;branch if its max 
        MOVE    D2,D0            ;min=next
CHECKMAX
        CMP     D1,D2            ;compares D1 and D2
        BLE     NOTMINMAX        ;branch if D2 is less than D1
        MOVE    D2,D1            ;max = next
NOTMINMAX
        SUB     #1,D3            ;decrement counter
        BRA     AGAIN            ;do it again


DONE    SIMHALT      

        ORG     $9000
LIST    DC.W    1,2,3,4,5,6,7,8  ;list of word values
LENGTH  DC.W    (LENGTH-LIST)/2  ;length of the list
        END     START






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
