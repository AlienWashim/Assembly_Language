.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX,2  ;INPUT
    MOV BL,3
    
    MUL BL
    AAM ;MULTI VALUE
    
    MOV BL,AL
    ADD BL,48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN 
    