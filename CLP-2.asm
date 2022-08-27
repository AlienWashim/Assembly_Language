GRADE MACRO S
    MOV AX,S
    ;PRINTN 'INSIDE GRADE'
    
    COMP:
    CMP AX,PLUS
    JGE SAVE_A
    CMP AX,FAIL
    JL SAVE_F
    JMP BACK
    
    SAVE_A:
    MOV AX,N_A
    ADD AX,1
    MOV N_A,AX
    JMP BACK
    
    SAVE_F:
    MOV AX,N_F
    ADD AX,1
    MOV N_F,AX
    JMP BACK
    
    
    GRADE ENDM

SHOW MACRO
    
    PRINT 'NUMBER OF A+ : '
    MOV AX,N_A
    CALL PRINT_NUM
    
    PRINTN
    
    PRINT 'NUMBER OF FAIL : '
    MOV AX,N_F
    CALL PRINT_NUM
    
    JMP EXIT
    
    RET
    SHOW ENDM

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
A DW ?
PLUS DW 80
FAIL DW 40
N_A DW 0
N_F DW 0
TEMP DW ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    CALL INPUT
    SHOW1:
    SHOW
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    DEFINE_SCAN_NUM
    
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
    
    INPUT PROC
        
        
        MOV BX,5
        
        LV:
        CMP BX,0
        JE SHOW1
        PRINT 'ENTER MARKS : '
        CALL SCAN_NUM 
        PRINT ' '
        GRADE CX
        BACK:
        DEC BX 
        LOOP LV
               
               
        JMP SHOW1
        
        RET
        INPUT ENDP
END MAIN