.Model small
.STACK 100H
.DATA  
.CODE
MAIN PROC 
         MOV AH,1 ;INPUT
         INT 21H 
         MOV BL,AL
         

       
       MOV AH,2
       MOV DL,10    ;NEWLINE
       INT 21H
       
       MOV DL,13 ; delete extra space
       INT 21H
       
       MOV AH, 02H ;DISPLAY
       MOV DL, BL
         INT 21H
    
         MOV AH,4CH   ;RETURN TO OS
         INT 21H
         
         
    
    MAIN ENDP

END MAIN