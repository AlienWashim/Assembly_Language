.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    MOV AH,1   ;INPUT
    INT 21H
    
    MOV BL,AL   ;MOVE INPUT INTO BL
    
    MOV AH,2
    MOV DL,10 ;NELINE
    INT 21H

    MOV AH,2
    MOV DL,13 ;REMOVE EXTRA SPACE
    INT 21H        
           
    MOV AH,2     ; DIPLAY
    MOV DL, BL
    INT 21H
    
    MOV AH, 4CH   ;BACK TO OS
    INT 21H
    
    
    MAIN ENDP
END MAIN


