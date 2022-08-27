MY_MACRO MACRO A,B
    
    
    MOV AL,0
    ADD AL,A
    ADD AL,B
    
    PRINT 'SUM = '
    MOV AH,2
    MOV DL,AL
    SUB DL,48
    INT 21H  
    
    PRINTN                                              
    
    ENDM

                                                         
INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    
    PRINT '1ST NUMBER: '
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    PRINTN
    PRINT '1ST INPUT IS= '
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    PRINTN
    PRINT '2ND NUMBER: '
    MOV AH,1
    INT 21H    
    MOV BH,AL
    
    
    PRINTN
    MY_MACRO BL,BH 
    
    MOV AH,4CH   ;BACK TO OS
    INT 21H
    MAIN ENDP
END MAIN