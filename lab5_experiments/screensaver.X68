*---------------------------------------------------------------
* Title      : screensaver
* Your Name  : DAMAN KUMAR
* Your ID    : 1306900
* Lab Sec    : 105
* Date       : 2024/10/25

* I have exclusive control over this submission via my password. 
* By including this statement in this header, I certify that
* I have read and understood the University policy in academic
* integrity and I assert that this work is my own. I have 
* not used any unapproved external resources including LLM 
* models. Furthermore, I certify that is assignment was 
* prepared by me specifically for this course.

*---------------------------------------------------------------
    ORG    $1000
DRAW    INCBIN  'draw.BIN'    ; This loads the external binary file for system calls

START:
    ; Initialize movement variables
    MOVE.W  #1, D0            ; DX = 1 (moving right)
    MOVE.W  #1, D1            ; DY = 1 (moving down)
    
MainLoop:
    ; Erase the image at the current position
    JSR     DRAW              ; System call to erase image at (X, Y)

    ; Update X position
    MOVE.W  X, D2             ; Load current X into D2
    ADD.W   D0, D2            ; D2 = X + DX
    MOVE.W  D2, X             ; Store the new X position in X

    ; Update Y position
    MOVE.W  Y, D3             ; Load current Y into D3
    ADD.W   D1, D3            ; D3 = Y + DY
    MOVE.W  D3, Y             ; Store the new Y position in Y

    ; Checking if the bitmap has hit the boundaries and needs to bounce

    ; Checking for collision with the left and right boundaries
    CMP.W   #0, X             ; If X <= 0
    BLT     BounceX           ; Bounce in X direction (left boundary)
    
    CMP.W   #608, X           ; If X + 32 >= 640 (right boundary)
    BGT     BounceX           ; Bounce in X direction

    ; Check for collision with the top and bottom boundaries
    CMP.W   #0, Y             ; If Y <= 0
    BLT     BounceY           ; Bounce in Y direction (top boundary)
    
    CMP.W   #448, Y           ; If Y + 32 >= 480 (bottom boundary)
    BGT     BounceY           ; Bounce in Y direction

    ; Draw the image at the new position
    JSR     DRAW              ; System call to draw image at (X, Y)

    ; Loop to keep the screen saver running
    BRA     MainLoop          ; Repeat the loop

BounceX:
    NEG.W   D0                ; Invert DX to change direction
    BRA     MainLoop

BounceY:
    NEG.W   D1                ; Invert DY to change direction
    BRA     MainLoop

    SIMHALT          
    
* Do not make changes to this section of the program    *   
    ORG $9000                                           *
X       DC.W    7                                       *
Y       DC.W    21                                      *
BITMAP  DC.L    %11111111111111111111111111111111       * 
        DC.L    %11111111111111111111111111111111       * 
        DC.L    %11111111111111111111111111111111       * 
        DC.L    %11111111111111111111111111111111       *       
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       * 
        DC.L    %11110000111100001111000011111111       * 
        DC.L    %11110000111100001111000011111111       *    
        DC.L    %11110000111100001111000011111111       * 
        DC.L    %11110000111100001111000011111111       *   
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       * 
        DC.L    %11110000111100001111000011111111       * 
        DC.L    %11110000111100001111000011111111       *    
        DC.L    %11110000111100001111000011111111       * 
        DC.L    %11110000111100001111000011111111       *
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       *
        DC.L    %11111111000011110000111100001111       * 
        DC.L    %11110000111100001111000011111111       * 
        DC.L    %11110000111100001111000011111111       *    
        DC.L    %11110000111100001111000011111111       * 
        DC.L    %11110000111100001111000011111111       *      
        DC.L    %11111111111111111111111111111111       *  
        DC.L    %11111111111111111111111111111111       * 
        DC.L    %11111111111111111111111111111111       *  
        DC.L    %11111111111111111111111111111111       *  
*********************************************************   
    END    START 










*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
