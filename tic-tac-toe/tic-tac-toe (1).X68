*-----------------------------------------------------------
* Title        : Tic-Tac-Toe.X68
* Student Name :DAMAN KUMAR
* Student ID   :1306900
* Lab Section  :105
* Description  : Use this template to implement the game
*-----------------------------------------------------------
    
            ORG    $1000
_MAIN:                  

            
            jsr     setup_board         ;put digits 1-9 into squares

LOOP        jsr     display_board       ;display board on console
            
            jsr     get_move            ;player X goes first - get pointer to selected square
            move.b  #'X',(a0)           ;put X in square pointed at by A0
            jsr     display_board       ;update board with new square containing X
            jsr     line                ;check for a winnig line and exit if found
            
            jsr     get_move            ;player Y's turn - get pointer to selected square
            move.b  #'Y',(a0)           ;put Y in square pointed ab by A0
            jsr     display_board       ;update board with new square containing X
            jsr     line                ;check for a winning line and exit if found

            bra     LOOP 

** end of main subroutine


** all subroutines follow below
          
**************************************************************
* setup_board: puts digits 1-9 into the board data structure *   
*                                                            *
*      ENTER: no parameters                                  * 
*       EXIT: no return value(s)                             *
*       Uses: no subroutines                                 *
**************************************************************
setup_board:
            lea     board,a0            ;put address of board in a0
            move.b  #9,d0               ;count 9 squares
            move.b  #'1',d1             ;put ascii code for '1' into d1
L1          move.b  d1,(a0)+            ;save it in the current square
            add.b   #1,d1               ;get next ascii digit
            cmpi.b  #'9',d1             ;repeat for remaining digits
            bls     L1                  
            rts 

get_move: 
         LEA     BOARD,A0
         JSR     READ_CHAR              ;READ THE CHARACTHER
         CMPI.B  #$1B, D1
         BEQ     ERROR
         CMPI.B  #'9',D1                 
         BHI     ERROR
         CMPI.B  #'X',(A0)
         BEQ     INVALID
         CMPI.B  #'Y',(A0)
         BEQ     INVALID
         SUBI.B   #$31,D1
         LEA    (A0,D1),A0
         RTS
         
 
INVALID  CLR.B D1
         BRA get_move

line:
    ; Set up a pointer to the board
    lea     board, A0              ; Load base address of the board into A0

    ; Check Row 1 (cells 0, 1, 2)
    move.b  (A0), D1               ; Load board[0] into D1
    cmp.b   1(A0), D1              ; Compare board[0] with board[1]
    bne     check_row2             ; If not equal, move to the next row
    cmp.b   2(A0), D1              ; Compare board[0] with board[2]
    beq     winner_found           ; If all three are equal, winner is found

check_row2:
    ; Check Row 2 (cells 3, 4, 5)
    move.b  3(A0), D1              ; Load board[3] into D1
    cmp.b   4(A0), D1              ; Compare board[3] with board[4]
    bne     check_row3             ; If not equal, move to the next row
    cmp.b   5(A0), D1              ; Compare board[3] with board[5]
    beq     winner_found           ; If all three are equal, winner is found

check_row3:
    ; Check Row 3 (cells 6, 7, 8)
    move.b  6(A0), D1              ; Load board[6] into D1
    cmp.b   7(A0), D1              ; Compare board[6] with board[7]
    bne     check_col1             ; If not equal, move to the next check
    cmp.b   8(A0), D1              ; Compare board[6] with board[8]
    beq     winner_found           ; If all three are equal, winner is found

check_col1:
    ; Check Column 1 (cells 0, 3, 6)
    move.b  (A0), D1               ; Load board[0] into D1
    cmp.b   3(A0), D1              ; Compare board[0] with board[3]
    bne     check_col2             ; If not equal, move to the next column
    cmp.b   6(A0), D1              ; Compare board[0] with board[6]
    beq     winner_found           ; If all three are equal, winner is found

check_col2:
    ; Check Column 2 (cells 1, 4, 7)
    move.b  1(A0), D1              ; Load board[1] into D1
    cmp.b   4(A0), D1              ; Compare board[1] with board[4]
    bne     check_col3             ; If not equal, move to the next column
    cmp.b   7(A0), D1              ; Compare board[1] with board[7]
    beq     winner_found           ; If all three are equal, winner is found

check_col3:
    ; Check Column 3 (cells 2, 5, 8)
    move.b  2(A0), D1              ; Load board[2] into D1
    cmp.b   5(A0), D1              ; Compare board[2] with board[5]
    bne     check_diag1            ; If not equal, move to diagonals
    cmp.b   8(A0), D1              ; Compare board[2] with board[8]
    beq     winner_found           ; If all three are equal, winner is found

check_diag1:
    ; Check Diagonal 1 (cells 0, 4, 8)
    move.b  (A0), D1               ; Load board[0] into D1
    cmp.b   4(A0), D1              ; Compare board[0] with board[4]
    bne     check_diag2            ; If not equal, move to next diagonal
    cmp.b   8(A0), D1              ; Compare board[0] with board[8]
    beq     winner_found           ; If all three are equal, winner is found

check_diag2:
    ; Check Diagonal 2 (cells 2, 4, 6)
    move.b  2(A0), D1              ; Load board[2] into D1
    cmp.b   4(A0), D1              ; Compare board[2] with board[4]
    bne     no_winner              ; If not equal, no winner found
    cmp.b   6(A0), D1              ; Compare board[2] with board[6]
    beq     winner_found           ; If all three are equal, winner is found

no_winner:
    rts                             ; Return if no winning line found

winner_found:
    ; Determine and display winning message based on D1 value ('X' or 'Y')
    cmpi.b  #'X', D1               ; Check if the winner is 'X'
    beq     display_x_wins         ; If D1 contains 'X', display "X wins"
    cmpi.b  #'Y', D1               ; Check if the winner is 'Y'
    beq     display_y_wins         ; If D1 contains 'Y', display "Y wins"

display_x_wins:
    move.b  #'X', D1               ; Load 'X' into D1
    jsr     display_char           ; Display 'X'
    move.b  #' ', D1               ; Load space character
    jsr     display_char           ; Display space
    move.b  #'w', D1               ; Load 'w'
    jsr     display_char           ; Display 'w'
    move.b  #'i', D1               ; Load 'i'
    jsr     display_char           ; Display 'i'
    move.b  #'n', D1               ; Load 'n'
    jsr     display_char           ; Display 'n'
    move.b  #'s', D1               ; Load 's'
    jsr     display_char           ; Display 's'
    bra     ERROR               ; End the game

display_y_wins:
    move.b  #'Y', D1               ; Load 'Y' into D1
    jsr     display_char           ; Display 'Y'
    move.b  #' ', D1               ; Load space character
    jsr     display_char           ; Display space
    move.b  #'w', D1               ; Load 'w'
    jsr     display_char           ; Display 'w'
    move.b  #'i', D1               ; Load 'i'
    jsr     display_char           ; Display 'i'
    move.b  #'n', D1               ; Load 'n'
    jsr     display_char           ; Display 'n'
    move.b  #'s', D1               ; Load 's'
    jsr     display_char           ; Display 's'

ERROR    SIMHALT

*************************************************************
* display_board: show board in top-left corner of console   *   
*                                                           *
*      ENTER: no parameters                                 * 
*       EXIT: no return value(s)                            *
*       Uses: display_row, display_line subroutines         *
*************************************************************                                                                                                                            
display_board:
            
            ;set cursor position in console to (0,0) -- upper left corner
            
            clr.l   d1                  ;COL = 0 (high byte) ROW = 0 (low byte)
            move.b  #11,d0              ;task 11
            trap   #15                  ;call operating system

            ;draw board one line at a time             
            lea     board,a0            ;put address of board in a0 
            jsr     display_row         ;show first row of board
            jsr     display_line        ;show line separator
            jsr     display_row         ;show first row of board
            jsr     display_line        ;show line separator
            jsr     display_row         ;show first row of board
            rts


*************************************************************
* display_row: display 3 squares in curent row on consol    *   
*                                                           *
*      ENTER: A0 contains address of first square in row    * 
*       EXIT: no return value(s)                            *
*       Uses: display_square, display_char subroutines      *
*************************************************************      
display_row:
            move.b  #' ',d1
            jsr     display_char
            jsr     display_square
            move.b  #' ',d1
            jsr     display_char
            move.b  #'|',d1
            jsr     display_char
            move.b  #' ',d1
            jsr     display_char
            jsr     display_square
            move.b  #' ',d1
            jsr     display_char
            move.b  #'|',d1
            jsr     display_char
            move.b  #' ',d1
            jsr     display_char
            jsr     display_square
            jsr     newline  
            rts
            

*************************************************************
* display_line: display separator line on console           *
*                                                           *
*      ENTER: no parameters                                 * 
*       EXIT: no return value(s)                            *
*       Uses: newline, display_char subroutines             *
*************************************************************  
display_line:
            move.b  #'-',d1
            jsr     display_char
            jsr     display_char
            jsr     display_char
            move.b  #'+',d1
            jsr     display_char

            move.b  #'-',d1
            jsr     display_char
            jsr     display_char
            jsr     display_char
            move.b  #'+',d1
            jsr     display_char
            
            move.b  #'-',d1
            jsr     display_char
            jsr     display_char
            jsr     display_char
            
            jsr     newline
            rts


*************************************************************
* newline: send carriage return, linefeed chars to console  *
*                                                           *
*      ENTER: no parameters                                 * 
*       EXIT: no return value(s)                            *
*       Uses: display_char subroutine                       *
*************************************************************  
newline:
            move.b  #$d,d1          ;carriage retrun
            jsr     display_char    ;send to console
            move.b  #$a,d1          ;linefeed
            jsr     display_char    ;send to console
            rts
            
            
*************************************************************
* display_square: display X or Y square on console          *
*                                                           *
*      ENTER: A0 contains address of square                 * 
*       EXIT: A0 incremented to point to next square        *
*       Uses: display_char subroutine                       *
*************************************************************  
display_square:
            move.b  (a0)+,d1        ;get char in square
            jsr     display_char    ;display char
            rts


*************************************************************
* display_char: send ASCII character to console             *
*                                                           *
*      ENTER: character in D1.B                             * 
*       EXIT: no return value(s)                            *
*       Uses: no subroutines, calls OS routines             *
*************************************************************  
display_char:

        movem.l d0/d1,-(sp)         ;save working registers
        move.b  #6,d0               ;task number 6
        trap    #15                 ;call operating system
        movem.l (sp)+,d0/d1         ;restore registers
        rts

    
*************************************************************
* read_char: read key from keyboard with NO echo            *
*                                                           *
*      ENTER: no parameters                                 * 
*       EXIT: ASCII value of key in D1.B                    *
*       Uses: no subroutines, calls OS I/O routines         *
*************************************************************  
read_char:
        
        ;start by turning off keyboard echo
        clr.b   d1                  ;set lower byte to zero
        move.b  #12,d0              ;select task 12
        trap    #15                 ;call OS
        
        ;now read a single ascii character into D1.B
        move.b  #5,d0               ;select task 5  
        trap    #15                 ;call OS
        rts
        







* Allocate memory for 3x3 board data strucutre

           org     $A000
board      ds.b    9           
           end    _MAIN        ; last line of source



*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
