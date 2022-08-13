.Model small
.STACK 100H
.DATA  
.CODE
MAIN PROC 
         MOV AH,1 ;INPUT-1
         INT 21H 
         MOV BL,AL
         
         MOV AH,2
         MOV DL,10   ;NEWLINE
         INT 21H
         MOV DL,13
         INT 21H
         
         MOV AH,1 ;INPUT-1
         INT 21H 
         MOV BH,AL
         
         MOV AH,2
         MOV DL,10
         INT 21H      ;NEWLINE
         MOV DL,13
         INT 21H 
         
         MOV CH,BH
         ADD BH,BL 
         SUB BH,48
         
         MOV AH,2
         MOV DL,BH
         INT 21H
         
                
         MOV AH,2
         MOV DL,10
         INT 21H   ;NEWLINE
         MOV DL,13
         INT 21H
         
         SUB CH,BL
         ADD CH,48
 
         
         MOV AH,2
         MOV DL,CH
         INT 21H

       
       
    
         MOV AH,4CH   ;RETURN TO OS
         INT 21H
         
         
    
    MAIN ENDP

END MAIN