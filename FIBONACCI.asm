FIBO MACRO A
    
    MOV BH,NUM
    
    MOV BL,A
    SUB BL,48
    CMP BL,0
    JE EXIT
    
    PRINT 'FIBO SERIES: '
    
    
    MOV AH,2
    MOV DL,NUM
    ADD DL,48
    INT 21H
    
    PRINT ' '
    
    MOV AH,2
    MOV DL,NUM
    ADD DL,48
    INT 21H
    
    CMP BL,1
    JE EXIT
    
    PRINT ' '
    
    FIB:
    ADD BH,NUM
    SUB BH,48
    
    CMP BH,BL
    JG EXIT
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    PRINT ' '
    MOV NUM,BH
    ADD BH,48
    LOOP FIB
    
    
    FIBO ENDM

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    A DB ?                                   ;1 1 2 3 5 8 13  FIBO SERIES
    NUM DB 1
    HELP DB ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT 'ENTER ANY NUMBER: '
    MOV AH,1
    INT 21H
    MOV A,AL
    
    PRINTN
    
    FIBO A
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN