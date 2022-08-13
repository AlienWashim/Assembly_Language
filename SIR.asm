.MODEL SMALL
.STACK 100H
.DATA
L DB 'PRINT $'  
.CODE
MAIN PROC 
         
         MOV CX,9   ;LOOPING NUMBER
         MOV BL,1
         
         LEV1:
         ADD BL,48
         
         MOV AH,2
         MOV DL,BL
         INT 21H
         
         MOV AH,2
         MOV DL,10
         INT 21H    ;NEWLINE
         MOV DL,13
         INT 21H
         
         INC BL
         SUB BL,48
         LOOP LEV1

       
         FINISH:  
         MOV AH,4CH   ;RETURN TO OS
         INT 21H
                  
    
    MAIN ENDP

END MAIN