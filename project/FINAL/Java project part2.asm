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
        
        
        CMP AL,2
        JE JAVA_BOOKS
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP CSE_BOOKS
            
            
            CSE_BOOKS ENDP
;E-----------------------------------------------------------    


;S----------------------------------------------------------- JAVA START
        JAVA_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.Java Thread Programming by A N M Bazlur Rahman                 PRICE:248TK'
        PRINTN
        PRINT ' 2.Advanced Java Programming by A N M Bazlur Rahman               PRICE:347TK'
        PRINTN
        PRINT ' 3.Effective Java by Joshua Bloch                                 PRICE:375TK'
        PRINTN
        PRINT ' 4.Java Performance: The Definitive Guide by Scott Oaks           PRICE:375TK'
        PRINTN
        PRINT ' 5.Core Java, Volume II--Advanced Features by Cay S. Horstmann    PRICE:645TK'
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
        
        CMP AL,1
        JE JAVA_BOOK1
        
        CMP AL,2
        JE JAVA_BOOK2
        
        CMP AL,3
        JE JAVA_BOOK3
        
        CMP AL,4
        JE JAVA_BOOK4
        
        CMP AL,5
        JE JAVA_BOOK5
        
        CMP AL,6
        JE CSE_BOOKS
    
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP JAVA_BOOKS
            
            
            JAVA_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        JAVA_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' Java Thread Programming by A N M Bazlur Rahman '
            PRINTN
            PRINT ' *** PRICE: 248TK ***'
            PRINTN
            
            MOV BX,248
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            JAVA_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            JAVA_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' Advanced Java Programming by A N M Bazlur Rahman '
            PRINTN
            PRINT ' *** PRICE: 347TK ***'
            PRINTN
            
            MOV BX,347
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            JAVA_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        JAVA_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' Effective Java by Joshua Bloch '
            PRINTN
            PRINT ' *** PRICE: 375TK ***'
            PRINTN
            
            MOV BX,375
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            JAVA_BOOK3 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            JAVA_BOOK4 PROC
            
            PRINTN
            PRINTN
            PRINT ' Java Performance: The Definitive Guide by Scott Oaks '
            PRINTN
            PRINT ' *** PRICE: 375TK ***'
            PRINTN
            
            MOV BX,375
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            JAVA_BOOK4 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            JAVA_BOOK5 PROC
            
            PRINTN
            PRINTN
            PRINT ' Core Java, Volume II--Advanced Features by Cay S. Horstmann '
            PRINTN
            PRINT ' *** PRICE: 645TK ***'
            PRINTN
            
            MOV BX,645
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            JAVA_BOOK5 ENDP
;E----------------------------------------------------------- JAVA END


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