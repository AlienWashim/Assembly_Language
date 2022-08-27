EVEN_ODD MACRO ARRAY,SIZE
    
    MOV SI,OFFSET ARRAY
    MOV CX,SIZE
    
    CHECKER:
    MOV BL,
    
    ENDM


INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
ARRAY1 DB ?
ARRAY_SIZE DW ?
X DB ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT 'NUMBER OF ITEM: '
    CALL INPUT
    MOV AH,0
    MOV CX,AX
    MOV ARRAY_SIZE,AX    
    
    PRINTN
        
    PRINT 'ENTER ARRAY ELEMENT: '
    CALL ARR_INPUT
    PRINTN
    
    MOV CX,0
    EVEN_ODD ARRAY1,ARRAY_SIZE
    
    
    MOV AH,4CH   ;BACK TO OS
    INT 21H
    MAIN ENDP 
    
    INPUT PROC
        
        MOV AH,1
        INT 21H
        
        RET
        INPUT ENDP
    
    ARR_INPUT PROC
        
        MOV SI,OFFSET ARRAY1
        MOV CX,0
        MOV CX,ARRAY_SIZE
        SUB CX,48
        
        ARR:
        MOV AH,1
        INT 21H
        MOV ARRAY1[SI],AL    
        INC SI
        PRINT ' '
        LOOP ARR
        
        RET
        
        ARR_INPUT ENDP

END MAIN