PAYMENT MACRO TOTAL
    
    MOV BX,TOTAL
    CMP BX,500
    JGE OFFER
    
    NO_OFFER:
    PRINTN
    PRINT 'YOUR TOTAL BILL: '
    MOV AX,TOTAL
    CALL PRINT_NUM
    PRINT 'TK'
    PRINTN
    JMP S_OPTION
    
    OFFER:
    PRINTN
    PRINT 'YOUR TOTAL COST WITH 10% OFFER: '
    MOV AX,TOTAL
    MOV BX,10
    MUL BX
    MOV BX,100
    DIV BX
    
    MOV DIS,AX
    
    MOV BX,TOTAL
    SUB BX,DIS
    MOV PAY,BX
    MOV AX,BX
    
    CALL PRINT_NUM
    PRINT 'TK'
    PRINTN
    JMP S_OPTION
    
    
    PAYMENT ENDM


PRICE_CALCULATOR MACRO PRICE
    
    PRINT ' ENTER QUANTITY: '
    CALL SCAN_NUM
    MOV QUANTITY,CX
    MOV AX,CX
    
    MOV BX,PRICE
    MUL BX
    
    MOV COST,AX
    
    PRINTN
    PRINT ' COST: '
    CALL PRINT_NUM
    PRINTN 'TK'
    MOV BX,COST
    
    ADD TOTAL,BX
    
    PRINTN
    PRINT ' TOTAL: '
    MOV AX,TOTAL
    CALL PRINT_NUM
    PRINTN 'TK'
    
    MOV COST,0
    
    CALL CONTINUE
        
    
    PRICE_CALCULATOR ENDM


INCLUDE 'EMU8086.INC'
.MODEL LARGE
.STACK 100H
.DATA
    USER DB 'WASHIM'
    PWD DB '123'
    OP DB ?
    BALANCE DW 0
    QUANTITY DW ?
    COST DW 0
    DIS DW ?
    PRICE DW ?
    PAY DW ?
    TOTAL DW 0

.CODE
MAIN PROC
    ROOT:
    MOV AX, @DATA
    MOV DS, AX
    
    CALL CSE_BOOKS
    
    
    
    EXIT:
    PRINTN
    PRINTN 'EXIT DONE'
    MOV AH,4CH
    INT 21H 
    
    MAIN ENDP

    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS

;S---------------------------------------------------------    
    S_OPTION PROC
        
        S_OP:
        
        PRINTN
        PRINTN
        PRINT ' ****..WELCOME TO YOUR LIBRARY..****'
        PRINTN
        PRINT '*****.....CHOOSE OPTION.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.BUY BOOKS'
        PRINTN
        PRINT ' 2.VIEW BALANCE'
        PRINTN
        PRINT ' 3.ADD BALANCE'
        PRINTN
        PRINT ' 4.LOGOUT'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE CALL OP_CATEGORY
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP S_OP
        
        S_OPTION ENDP
;E---------------------------------------------------------
    
;S---------------------------------------------------------
    OP_CATEGORY PROC
        
        CATEGORY_OP:
        
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE DEPARTMENT.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.CSE'
        PRINTN
        PRINT ' 2.EEE'
        PRINTN
        PRINT ' 3.TEXTILE'
        PRINTN
        PRINT ' 4.ENGLISH'
        PRINTN
        PRINT ' 5.BBA'
        PRINTN
        PRINT ' 6.BACK TO MAIN MENU'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE CSE_BOOKS
        
        
        CMP AL,6
        JE S_OPTION
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP CATEGORY_OP
        
        OP_CATEGORY ENDP
;E---------------------------------------------------------

;S----------------------------------------------------------- CSE START        
        CSE_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE TYPE.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.C '
        PRINTN
        PRINT ' 2.JAVA '
        PRINTN
        PRINT ' 3.ALGORITHM'
        PRINTN
        PRINT ' 4.WEB DEVELOPMENT'
        PRINTN
        PRINT ' 5.ASSEMBLY'
        PRINTN
        PRINTN
        PRINT ' 6.BACK TO PREVIOUS MENU'
        PRINTN
        PRINT ' 7.BACK TO MAIN MENU'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
      
        
        CMP AL,3
        JE ALGORITHM_BOOKS
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP CSE_BOOKS
            
            
            CSE_BOOKS ENDP
;E-----------------------------------------------------------    

;S----------------------------------------------------------- ALGORITHM START
        ALGORITHM_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.Machine Learning Algorithm By Nafis Neehal           PRICE:212TK'
        PRINTN
        PRINT ' 2.Programming Contest Data Structure and Algorithm     PRICE:347TK'
        PRINTN
        PRINT ' 3.The Algorithm Design Manual                          PRICE:400TK'
        PRINTN
        PRINT ' 4.BACK TO PREVIOUS MENU'
        PRINTN
        PRINT ' 5.BACK TO MAIN MENU'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE ALGORITHM_BOOK1
        
        CMP AL,2
        JE ALGORITHM_BOOK2
        
        CMP AL,3
        JE ALGORITHM_BOOK3
        
        CMP AL,4
        JE CSE_BOOKS
  
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP ALGORITHM_BOOKS
            
            
            ALGORITHM_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        ALGORITHM_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' Machine Learning Algorithm By Nafis Neehal '
            PRINTN
            PRINT ' *** PRICE: 212TK ***'
            PRINTN
            
            MOV BX,212
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ALGORITHM_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            ALGORITHM_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' Programming Contest Data Structure and Algorithm '
            PRINTN
            PRINT ' *** PRICE: 347TK ***'
            PRINTN
            
            MOV BX,347
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ALGORITHM_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        ALGORITHM_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' The Algorithm Design Manual '
            PRINTN
            PRINT ' *** PRICE: 400TK ***'
            PRINTN
            
            MOV BX,400
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ALGORITHM_BOOK3 ENDP
;E----------------------------------------------------------- ALGORITHM END

;E----------------------------------------------------------- CSE END

;S-----------------------------------------------------------
    CONTINUE PROC
        
    PRINTN
    PRINTN ' GET 10% DISCOUNT OVER 500TK PURCHASE'
    PRINT '*****.....CHOOSE OPTION......*****'
    PRINTN
    PRINTN
    PRINT ' 1.CONTINUE BUYING'
    PRINTN ' 2.PAY BILL'
    PRINTN
    PRINT ' CHOOSE = '
    MOV AH,1
    INT 21H
    SUB AL,48
    
    CMP AL,1
    JE OP_CATEGORY
        
    CMP AL,2
    JE PAY_BILL
    
    PRINTN
    PRINTN ' WRONG SELECTIN'
    PRINTN
    
    JMP CONTINUE
    
    PAY_BILL:
    PAYMENT TOTAL
    
    CONTINUE ENDP
;E-----------------------------------------------------------     
    
END MAIN