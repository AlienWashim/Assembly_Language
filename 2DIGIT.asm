.MODEL SMALL
.STACK 100H
.DATA
L DB 'PRINT $'  
.CODE
MAIN PROC 
         
         MOV BL,7
         MOV BH,7
         ADD BL,BH
         ADD BL,48
         
         MOV AH,2
         MOV DL,BL
         INT 21H
         

       
         FINISH:  
         MOV AH,4CH   ;RETURN TO OS
         INT 21H
                  
    
    MAIN ENDP

END MAIN