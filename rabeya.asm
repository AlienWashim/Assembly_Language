DAO MACRO A,B,C,D
    
    MOV BL,B    ; B>C
    CMP BL,C    ;BL=7 C=6
    JLE JMP NOTA 
    
    ;PRINTN 'LEVEL 1 PASSED'
    
    MOV BL,D    ;D>A
    CMP BL,A    ;BL=10 D=4
    JLE JMP NOTA
    
    ;PRINTN 'LEVEL 2 PASSED'
    
    XOR AH,AH
    MOV  AL,C
    ADD AL,D
    
    MOV BL,A
    ADD BL,B
    
    CMP AL,BL
    JLE NOTA
    
    ;PRINTN 'LEVEL 3 PASSED'
    
    MOV AL,A
    MOV BL,2
    DIV BL
    
    CMP AH,0
    JNE NOTA
    
    ;PRINTN 'ALL LEVEL PASSED'
    
    JMP ACCEPT
    
    DAO ENDM

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H                  ;A=4, B=7, C=6, D=10
.DATA
A DB ?
B DB ?
C DB ?
D DB ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT 'ENTER 1ST NUMBER: '
    CALL SCAN_NUM
    MOV A,CL
    
    PRINTN
    PRINT 'ENTER 2ND NUMBER: '
    CALL SCAN_NUM
    MOV B,CL
    
    PRINTN
    PRINT 'ENTER 3RD NUMBER: '
    CALL SCAN_NUM
    MOV C,CL
    
    PRINTN
    PRINT 'ENTER 4TH NUMBER: '
    CALL SCAN_NUM
    MOV D,CL
    
    DAO A,B,C,D
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
    
    DILAM PROC
        ACCEPT:
        PRINTN 'ACCEPTED VALUE'
        PRINTN
        JMP EXIT
        
        NOTA:
        PRINTN 'NOT ACCEPTED VALUE'
        PRINTN
        
        JMP EXIT
        DILAM ENDP
    
END MAIN