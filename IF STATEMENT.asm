.MODEL SMALL
.STACK 100H
.DATA
G DB 'THIS IS GREATER$' ;MESSAGE FORMAT
L DB 'THIS IS SMALLER$'
E DB 'THIS IS EQUAL$'
A DB ?
B DB ?
NEWLINE DB 0DH,0AH,"$"
.CODE
MAIN PROC
                               
    
    MOV AX,@DATA  ;LOAD DATA
    MOV DS,AX     ;COPY DATA FOR SAFETY
    
    MOV AH,1
    MOV A,AL
    INT 21H
    
    MOV AH,9
    LEA DX,NEWLINE
    INT 21H
    
    MOV AH,1
    MOV BL,AL
    INT 21H
    
    MOV AH,9
    LEA DX,NEWLINE
    INT 21H
    
    
    CMP A,BL
    JG LEV1
    
    CMP A,BL
    JL LEV2
    
    CMP A,BL
    JE LEV3
    
    LEV1:
    MOV AH,9   ;IF GREATER
    LEA DX,G
    INT 21H
    JMP LEV4

    LEV2:
    MOV AH,9     ;IF SMALLER
    LEA DX,L
    INT 21H
    JMP LEV4
    
    LEV3:
    MOV AH,9     ;IF EQUAL
    LEA DX,E
    INT 21H
    JMP LEV4
    
    LEV4:
    MOV AH,4CH        ;BACK TO OS
    INT 21H
    
    MAIN ENDP
END MAIN 
    