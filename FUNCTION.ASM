INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
SUM DB ?
A DB ?
B DB ?
C DB ?
LG DB ?
LOW DB ?
AV DB ?                                                 
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    PRINT 'ENTER FIRST ELEMENT: '
    MOV AH,1
    INT 21H
    MOV A,AL
    
    PRINTN 'VALUE OF A = '
    MOV AH,2
    MOV DL,A
    INT 21H
    
    PRINTN
    PRINT 'ENTER SECOND ELEMENT: '
    MOV AH,1
    INT 21H
    MOV B,AL
    
    
    
    PRINTN
    PRINT 'ENTER THIRD ELEMENT: '
    MOV AH,1
    INT 21H
    MOV C,AL
    
    
    PRINTN
    CALL HIGHP
     
    
    MAIN ENDP

    HIGHP PROC
          
          ST:
          MOV BH,B
          MOV BL,A
          
          CMP BL,B
          JG FINAL1
          JL FINAL2
          
          
          FINAL1:
          CMP BL,C
          JG PRINT1
          JL PRINT2
          JMP EXIT
          
          PRINT1:
          MOV AH,2
          MOV DL,A
          INT 21H
          PRINTN ' IS GRATER'
          JMP EXIT
          
          PRINT2:
          MOV AH,2
          MOV DL,C
          INT 21H
          PRINTN ' IS GRATER'
          JMP EXIT
          
          FINAL2:
          CMP BH,C
          JG PRINT11
          JL PRINT22
          JMP EXIT
          
          PRINT11:
          MOV AH,2
          MOV DL,B
          INT 21H
          PRINTN ' IS GRATER'
          JMP EXIT
          
          PRINT22:
          MOV AH,2
          MOV DL,C
          INT 21H
          PRINTN ' IS GRATER'
          
          EXIT:
          RET
          
                
          HIGHP ENDP
    

    
END MAIN