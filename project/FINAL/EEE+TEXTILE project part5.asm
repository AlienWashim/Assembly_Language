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
    MOV TOTAL,0
    JMP OP_CATEGORY
    
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
    MOV TOTAL,0
    JMP OP_CATEGORY 
    
    PAYMENT ENDM


PRICE_CALCULATOR MACRO PRICE
    
    PRINT ' ENTER QUANTITY: '
    CALL SCAN_NUM
    MOV QUANTITY,CX
    MOV AX,CX
    
    MOV BX,PRICE
    MUL BX
    
    ADD AX,COST
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
    
    CALL OP_CATEGORY
    
    
    
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
     
        CMP AL,2
        JE EEE_BOOKS
        
        CMP AL,3
        JE TEXTILE_BOOKS
  
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP CATEGORY_OP
        
        OP_CATEGORY ENDP
;E---------------------------------------------------------


;S----------------------------------------------------------- EEE START
        EEE_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.Basic Electrical Engineering (SIE) (Schaums Outline Series)     PRICE:1251TK'
        PRINTN
        PRINT ' 2.Basic Electronics                                               PRICE:650TK '
        PRINTN
        PRINT ' 3.Basic Electrical Engineering by R. S. Ananda Murthy             PRICE:554TK'
        PRINTN
        PRINT ' 4.Basic Electrical Engineering Eng I by  Abhijit Chakrabarti      PRICE:684TK'
        PRINTN
        PRINT ' 5.BACK TO PREVIOUS MENU'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE EEE_BOOK1
        
        CMP AL,2
        JE EEE_BOOK2
        
        CMP AL,3
        JE EEE_BOOK3
        
        CMP AL,4
        JE EEE_BOOK4
        
        CMP AL,5
        JE OP_CATEGORY
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP EEE_BOOKS
            
            
            EEE_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        EEE_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' Basic Electrical Engineering (SIE) (Schaums Outline Series) '
            PRINTN
            PRINT ' *** PRICE: 1251TK ***'
            PRINTN
            
            MOV BX,1251
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            EEE_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            EEE_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' Basic Electronics '
            PRINTN
            PRINT ' *** PRICE: 650TK ***'
            PRINTN
            
            MOV BX,650
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            EEE_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        EEE_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' Basic Electrical Engineering by R. S. Ananda Murthy '
            PRINTN
            PRINT ' *** PRICE: 554TK ***'
            PRINTN
            
            MOV BX,554
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            EEE_BOOK3 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            EEE_BOOK4 PROC
            
            PRINTN
            PRINTN
            PRINT ' Basic Electrical Engineering Eng I by  Abhijit Chakrabarti '
            PRINTN
            PRINT ' *** PRICE: 684TK ***'
            PRINTN
            
            MOV BX,684
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            EEE_BOOK4 ENDP
;E----------------------------------------------------------- EEE END

;S----------------------------------------------------------- TEXTILE START
        TEXTILE_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.Industrial Engineering In Apparel And Production Management     PRICE:240TK'
        PRINTN
        PRINT ' 2.Apparel Costing                                                 PRICE:333TK '
        PRINTN
        PRINT ' 3.Practical Hand Book Of Washing and Dyeing                       PRICE:433TK'
        PRINTN
        PRINT ' 4.Natural Fibers                                                  PRICE:385TK'
        PRINTN
        PRINT ' 5.Textile And Apparel Merchandising Interview Knowledge           PRICE:387TK'
        PRINTN
        PRINT ' 6.BACK TO PREVIOUS MENU'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE TEXTILE_BOOK1
        
        CMP AL,2
        JE TEXTILE_BOOK2
        
        CMP AL,3
        JE TEXTILE_BOOK3
        
        CMP AL,4
        JE TEXTILE_BOOK4
        
        CMP AL,5
        JE TEXTILE_BOOK5
        
        CMP AL,6
        JE OP_CATEGORY
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP TEXTILE_BOOKS
            
            
            TEXTILE_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        TEXTILE_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' Industrial Engineering In Apparel And Production Management '
            PRINTN
            PRINT ' *** PRICE: 240TK ***'
            PRINTN
            
            MOV BX,240
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            TEXTILE_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            TEXTILE_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' Apparel Costing '
            PRINTN
            PRINT ' *** PRICE: 333TK ***'
            PRINTN
            
            MOV BX,333
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            TEXTILE_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        TEXTILE_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' Practical Hand Book Of Washing and Dyeing '
            PRINTN
            PRINT ' *** PRICE: 433TK ***'
            PRINTN
            
            MOV BX,433
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            TEXTILE_BOOK3 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            TEXTILE_BOOK4 PROC
            
            PRINTN
            PRINTN
            PRINT ' Natural Fibers '
            PRINTN
            PRINT ' *** PRICE: 385TK ***'
            PRINTN
            
            MOV BX,385
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            TEXTILE_BOOK4 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            TEXTILE_BOOK5 PROC
            
            PRINTN
            PRINTN
            PRINT ' Textile And Apparel Merchandising Interview Knowledge '
            PRINTN
            PRINT ' *** PRICE: 387TK ***'
            PRINTN
            
            MOV BX,387
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            TEXTILE_BOOK5 ENDP
;E----------------------------------------------------------- TEXTILE END


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