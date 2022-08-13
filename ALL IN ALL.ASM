.MODEL SMALL
.STACK 100H
.DATA
     ENT1 DB 'ENTER A NUMBER: $'
     ENT2 DB 'ENTER ANOTHER NUMBER: $'
     SUM DB 'SUM = $'
     SUBT DB 'SUB = $'
     MULT DB 'MULTI = $'
     DIVI DB 'DIV : $'
     RES DB 'RESULT= $'
     REM DB 'REMAINDER= $'
     G DB 'GREATER $'
     L DB 'LESS $'
     E DB 'EQUAL $'
     A DB ?
     B DB ?
     HELP DB ?
     LP DB 1
     SLP DB 'START LOOP $'
     ELP DB 'END LOOP $'
     SCOMP DB 'START COMPARE$'
     ECOMP DB 'END COMPARE$'
     SARITH DB 'START ARITHMATIC OPERATION$'
     EARITH DB 'END ARITHMATIC OPERATION$'
     EV DB 'EVEN$'
     OD DB 'ODD$'
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,SARITH  ;START ARITHMATIC OPERATION
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H     ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,ENT1     ;ENTER A  NUMBER
    INT 21H
    
    MOV AX,0
    
    MOV AH,1 
    INT 21H
    MOV A,AL      ;INPUT 1
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,ENT2     ;ENTER ANOTHER NUMBER
    INT 21H
    
    MOV AX,0
    
    MOV AH,1 
    INT 21H
    MOV B,AL      ;INPUT 2
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,SUM     ;SUM =
    INT 21H    
    
    MOV BL,A
    MOV BH,B
    ADD BH,BL    ;SUM PROCESS
    SUB BH,48   ;HUMAN READABLE FORM
    
    MOV AH,2
    MOV DL,BH        ;SUM PRINT
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,SUBT     ;SUB =
    INT 21H    
    
    MOV BL,A
    MOV BH,B
    SUB BL,BH    ;SUB PROCESS
    ADD BL,48   ;HUMAN READABLE FORM
    
    MOV AH,2
    MOV DL,BL        ;SUB PRINT
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,MULT     ;MULTI =
    INT 21H    
    
    MOV AL,A
    MOV BH,B
    MUL BH    ;MULTI PROCESS
    AAM
    MOV BL,AL
    ADD BL,48   ;HUMAN READABLE FORM
    
    MOV AH,2
    MOV DL,BL        ;MULTI PRINT
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,DIVI     ;DIV =
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H    
    
    MOV AX,3
    MOV BH,2
    DIV BH    ;DIV PROCESS
    
    MOV BL,AL  ;RESULT STORE IN AL
    ADD BL,48   ;HUMAN READABLE FORM
    MOV BH,AH   ;REMAINDER STORE IN AH
    ADD BH,48   ;READABLE FORM
    
    MOV AH,9
    LEA DX,RES     ;RESULT =
    INT 21H
    
    MOV AH,2
    MOV DL,BL        ;RESULT PRINT
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,REM     ;REMAINDER =
    INT 21H
    
    MOV AH,2
    MOV DL,BH        ;REMAINDER PRINT
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,EARITH     ;END ARITHMATIC OPERATION
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,SCOMP     ;START COMPARE
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV BH,B
    CMP A,BH
    JG LEV1
    JL LEV2
    JE LEV3
    
    LEV1:
    MOV AH,9
    LEA DX,G     ;GREATER
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    JMP LEV4
    
    LEV2:
    MOV AH,9
    LEA DX,L     ;LESS
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    JMP LEV4
    
    LEV3:
    MOV AH,9
    LEA DX,E     ;EQUAL
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    JMP LEV4
    
    LEV4:
    MOV AH,9
    LEA DX,ECOMP     ;END COMPARE
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,SLP     ;START LOOP
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV CX,5
    LO0PING:
    
    ADD LP,48
    MOV AH,2
    MOV DL,LP
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    INC LP
    SUB LP,48
    
    LOOP LO0PING
    
    MOV AH,9
    LEA DX,ELP     ;END LOOP
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,ENT1     ;ENTER A  NUMBER
    INT 21H

    MOV AH,1 
    INT 21H
    MOV AH,0
    MOV BX,AX
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AX,BX
    
    ;MOV AL,BL   ;DEVIDE INPUT BY 2 IF REMAINDER = 0 THEN INPUT IS EVEN OTHERWISE ODD
    MOV BH,2
    DIV BH    ; RESULT IN AL, REMAINDER IN AH
    
    CMP AH,0
    JE LEVEV
    
    MOV AH,9
    LEA DX,OD     ;ODD
    INT 21H
    
    JMP CONT
    
    LEVEV:
    MOV AH,9
    LEA DX,EV     ;EVEN
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H       ;NEWLINE
    MOV DL,13
    INT 21H
    
    CONT:
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN