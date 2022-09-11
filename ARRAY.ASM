INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
AR DB '8','5', '3','4','7','1','2','6','9'
DEMO DB ?
A DW '0'
B DW ?                                                  
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV CX,9 
    
    ;PRINTN
       
    
    MOV SI,OFFSET AR
    
    
    
    ;PRINT 'DATA: '
    
    PRI:
    MOV AH,2
    MOV DL,[SI]
    INT 21H
    INC SI
    LOOP PRI
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN