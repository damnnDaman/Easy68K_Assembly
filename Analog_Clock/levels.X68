* I have exclusive control over this submission via my password.
* By including this statement in this header, I certify that
* I have read and understood the University policy in academic
* integrity and I assert that this work is my own. I have
* not used any unapproved external resources including LLM
* models. Furthermore, I certify that is assignment was
* prepared by me specifically for this course

*-----------------------------------------------------------
* Title      :levels
* Written by :Daman kumar
* Date       :27-11-2024
* Description: question 2
*-----------------------------------------------------------

* Prologue: Display hardware window from software

            ORG    $8000
START:      MOVE.L  #32,D0           ;task number 32
            CLR.B   D1               ;parameter: display window
            TRAP    #15              ;system call
*
* Place address of the ISRs into the vector table

            MOVE.L  #ISR1,$64
            MOVE.L  #ISR2,$68
            MOVE.L  #ISR3,$6C
            MOVE.L  #ISR4,$70
            MOVE.L  #ISR5,$74
            MOVE.L  #ISR6,$78
            MOVE.L  #ISR7,$7C


*
* Main () function continuously displays text message on screen

MAIN       
            ;TRAP     #15
           NOP
           BRA      MAIN


DELAY       EQU      $01000000



*------------------
*SOME PRINT MSGS
*------------------

START_MSG1   DC.B    'IRQ1 STARTS',0         
START_MSG2   DC.B    '  IRQ2 STARTS',0  
START_MSG3   DC.B    '      IRQ3 STARTS',0  
START_MSG4   DC.B    '          IRQ4 STARTS',0  
START_MSG5   DC.B    '              IRQ5 STARTS',0  
START_MSG6   DC.B    '                  IRQ6 STARTS',0  
START_MSG7   DC.B    '                      IRQ7 STARTS',0  


END_MSG1     DC.B    'IRQ1 ENDS',0         
END_MSG2     DC.B    '  IRQ2 ENDS',0 
END_MSG3     DC.B    '      IRQ3 ENDS',0 
END_MSG4     DC.B    '          IRQ4 ENDS',0 
END_MSG5     DC.B    '              IRQ5 ENDS',0 
END_MSG6     DC.B    '                  IRQ6 ENDS',0 
END_MSG7     DC.B    '                      IRQ7 ENDS',0 





*
* Interrupt service routine for level-1 auto-vector interrupt

ISR1:       ORI.W   #$0700,SR          ;set priority level to 7 to block other interrupts
            MOVEM.L A1/D0,-(A7)         ;save working registers
            ANDI.W  #$F1FF,SR          ;Clear interrupt priority mask bits (8, 9, 10)
            ;ORI.W   #$0100,SR          ;set priority level to 1
            LEA     START_MSG1 ,A1     ;point to message
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15
            MOVE.L  #DELAY,D0  
            BSR     DELAY_LOOP       
            LEA     END_MSG1, A1
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15                ;system call
            MOVEM.L (A7)+,A1/D0        ;restore working registers
            RTE                        ;use RTE to return from interrupt


           

* Interrupt service routine for level-2 auto-vector interrupt

ISR2:       ORI.W   #$0700,SR          ;set priority level to 7 to block other interrupts
            MOVEM.L A1/D0,-(A7)         ;save working registers
            ANDI.W  #$FAFF,SR          
            ;ORI.W   #$0200,SR          ;set priority level to 2
            LEA     START_MSG2 ,A1            ;point to message 
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15
            MOVE.L  #DELAY,D0  
            BSR     DELAY_LOOP
            LEA     END_MSG2, A1
     
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15                ;system call
             MOVEM.L (A7)+,A1/D0        ;restore working registers
            RTE                        ;use RTE to return from interrupt





* Interrupt service routine for level-3 auto-vector interrupt

ISR3:       ORI.W   #$0700,SR          ;set priority level to 7 to block other interrupts
            MOVEM.L A1/D0,-(A7)         ;save working registers
            ANDI.W  #$FBFF,SR          
            ;ORI.W   #$0300,SR       
            LEA     START_MSG3 ,A1            ;point to message
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15     
            MOVE.L  #DELAY,D0  
            BSR     DELAY_LOOP             
            LEA     END_MSG3, A1
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15                ;system call
            MOVEM.L (A7)+,A1/D0        ;restore working registers
            RTE                        ;use RTE to return from interrupt




* Interrupt service routine for level-4 auto-vector interrupt

ISR4:       ORI.W   #$0700,SR          ;set priority level to 7 to block other interrupts
            MOVEM.L A1/D0,-(A7)        ;save working registers
            ANDI.W  #$F4FF,SR          
            ;ORI.W   #$0400,SR         
            LEA     START_MSG4 ,A1            ;point to message     
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15
            MOVE.L  #DELAY,D0  
            BSR     DELAY_LOOP 
            LEA     END_MSG4, A1
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15                ;system call
             MOVEM.L (A7)+,A1/D0        ;restore working registers
            RTE                        ;use RTE to return from interrupt


* Interrupt service routine for level-5 auto-vector interrupt

ISR5:      ORI.W   #$0700,SR          ;set priority level to 7 to block other interrupts
            MOVEM.L A1/D0,-(A7)        ;save working registers
            ANDI.W  #$F5FF,SR          
           ; ORI.W   #$0500,SR         
            LEA     START_MSG5 ,A1            ;point to message     
            MOVE.L  #DELAY,D0  
            BSR     DELAY_LOOP             
            LEA     END_MSG5, A1
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15                ;system call
             MOVEM.L (A7)+,A1/D0        ;restore working registers
            RTE                        ;use RTE to return from interrupt



* Interrupt service routine for level-6 auto-vector interrupt

ISR6:       ORI.W   #$0700,SR          ;set priority level to 7 to block other interrupts
            MOVEM.L A1/D0,-(A7)        ;save working registers
            ANDI.W  #$F6FF,SR          
            LEA    START_MSG6 ,A1            ;point to message
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15  
            MOVE.L  #DELAY,D0
            
 
            BSR     DELAY_LOOP
            LEA     END_MSG6, A1    
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15                ;system call
             MOVEM.L (A7)+,A1/D0        ;restore working registers
            RTE                        ;use RTE to return from interrupt



* Interrupt service routine for level-1 auto-vector interrupt

ISR7:       ORI.W   #$0700,SR          ;set priority level to 7 to block other interrupts
            MOVEM.L A1/D0,-(A7)        ;save working registers
            ;ANDI.W  #$FAFF,SR        
             LEA     START_MSG7,A1            ;point to message
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15
            MOVE.L  #DELAY,D0  
            BSR     DELAY_LOOP 
            LEA     END_MSG7, A1
            MOVE.B  #13,D0             ;display message on console
            TRAP    #15  
            MOVEM.L (A7)+,A1/D0        ;restore working registers
            RTE                        ;use RTE to return from interrupt


           
           
           
*-----------------------------------------------------------
* Subroutine for Delay
*-----------------------------------------------------------


DELAY_LOOP: 
            NOP                     ; No operation
            SUBQ.L  #1,D0           ; Decrement counter
            BNE     DELAY_LOOP      ; Repeat until counter reaches 0
            RTS                     ; Return from subroutine



            END     START





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
