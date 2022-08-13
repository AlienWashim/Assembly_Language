.MODEL SMALL
.STACK 100H
.DATA
INP DB 'ENTER A NUMBER BETWEEN 1-9: $'
EV DB 'EVEN NUMBER: $'
OD DB 'ODD NUMBER: $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,INP
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H     ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,1
    INT 21H     ;INPUT
    MOV AH,0
    MOV BX,AX
    
    MOV AH,2
    MOV DL,10
    INT 21H     ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,EV
    INT 21H
    
    SUB BX,48
    
    MOV CX,BX
    MOV BH,1
    
    LOOPING:
    ADD BH,48
    
    MOV AX,0
    MOV AL,BH
    MOV BL,2
    DIV BL
    
    CMP AH,0
    JE LEV0
    LEV2:
    
    INC BH
    SUB BH,48
    
    LOOP LOOPING
    JMP FINISH
    
    LEV0:
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP LEV2
    
    
    FINISH:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN