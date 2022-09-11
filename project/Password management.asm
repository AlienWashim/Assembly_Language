INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    OP1 DB '1.LOGIN',10,13,'$'
    OP2 DB '3.EXIT',10,13,'$'
    PWD DB 'AKM'
    OP DB ?

.CODE
    MAIN:
    MOV AX, @DATA
    MOV DS, AX
    MOV BX, OFFSET PWD
    MOV CX, 3
    
    FIRST_OPTION:
    PRINT 'CHOOSE OPTION(1-2):'
    PRINTN
    PRINT '1.LOGIN'
    PRINTN
 
    PRINT '2.EXIT'
    PRINTN
    PRINTN
    PRINT 'CHOICE = '
    
    MOV AH,1
    INT 21H
    MOV OP,AL
    SUB OP,48
    
    PRINTN
    
    PRINT 'CHOOSE = '
    MOV AH,2
    MOV DL,OP
    INT 21H
    PRINTN
    
    MOV AL,OP
    CMP AL,1
    JE LOGIN
    CMP AL,2
    JE EXIT
    
    PRINTN
    
    JMP FIRST_OPTION 
    
    X: 
    MOV AH, 8
    INT 21H
    
    PUSH AX
    PUSH [BX]
    INC BX
    
    PRINT '*'
    
    LOOP X
    
    MOV CX, 3
    
    Y: 
    POP AX
    POP BX
    CMP BL, AL
    JNE ERROR
    LOOP Y
    
    PRINTN
    PRINTN 'LOGGED IN SUCCESSFULY'
    JMP EXIT
    
    ERROR: 
    PRINTN
    PRINT 'TRY AGAIN'
    PRINTN
    PRINTN
    JMP MAIN
    
    LOGIN:
    PRINT 'ENTER YOUR PASSWORD: '
    JMP X
    
    EXIT:
    
    PRINTN
    PRINTN 'THANKS'
    MOV AH,4CH
    INT 21H
END MAIN