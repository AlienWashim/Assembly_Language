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
     
        
        CMP AL,4
        JE ENGLISH_BOOKS
        
        CMP AL,5
        JE BBA_BOOKS
     
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP CATEGORY_OP
        
        OP_CATEGORY ENDP
;E---------------------------------------------------------


;S----------------------------------------------------------- ENGLISH START
        ENGLISH_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.English Writing Skill                               PRICE:200TK'
        PRINTN
        PRINT ' 2.A Comprehensive Approach To English Literature      PRICE:333TK'
        PRINTN
        PRINT ' 3.A Gateway to English Prose -8th Ed.                 PRICE:239TK'
        PRINTN
        PRINT ' 4.Introduction to Poetry                              PRICE:250TK'
        PRINTN
        PRINT ' 5.A Critical Review of Victorian Poetry               PRICE:211TK'
        PRINTN
        PRINT ' 6.BACK TO PREVIOUS MENU'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE ENGLISH_BOOK1
        
        CMP AL,2
        JE ENGLISH_BOOK2
        
        CMP AL,3
        JE ENGLISH_BOOK3
        
        CMP AL,4
        JE ENGLISH_BOOK4
        
        CMP AL,5
        JE ENGLISH_BOOK5
        
        CMP AL,6
        JE OP_CATEGORY
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP ENGLISH_BOOKS
            
            
            ENGLISH_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        ENGLISH_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' English Writing Skill '
            PRINTN
            PRINT ' *** PRICE: 200TK ***'
            PRINTN
            
            MOV BX,200
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ENGLISH_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            ENGLISH_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' A Comprehensive Approach To English Literature '
            PRINTN
            PRINT ' *** PRICE: 333TK ***'
            PRINTN
            
            MOV BX,333
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ENGLISH_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        ENGLISH_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' A Gateway to English Prose -8th Ed. '
            PRINTN
            PRINT ' *** PRICE: 239TK ***'
            PRINTN
            
            MOV BX,239
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ENGLISH_BOOK3 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            ENGLISH_BOOK4 PROC
            
            PRINTN
            PRINTN
            PRINT ' Introduction to Poetry '
            PRINTN
            PRINT ' *** PRICE: 250TK ***'
            PRINTN
            
            MOV BX,250
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ENGLISH_BOOK4 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            ENGLISH_BOOK5 PROC
            
            PRINTN
            PRINTN
            PRINT ' A Critical Review of Victorian Poetry '
            PRINTN
            PRINT ' *** PRICE: 211TK ***'
            PRINTN
            
            MOV BX,211
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ENGLISH_BOOK5 ENDP
;E----------------------------------------------------------- ENGLISH END

;S----------------------------------------------------------- ENGLISH START
        BBA_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.A History of Bangladesh By Willem van Schendel         PRICE:220TK'
        PRINTN
        PRINT ' 2.Accounting Principles By Jerry J. Weygandt             PRICE:240TK'
        PRINTN
        PRINT ' 3.Banking Law And Practice By P.N.Varshney               PRICE:220TK'
        PRINTN
        PRINT ' 4.Business And Commercial Law Study Manual               PRICE:170TK'
        PRINTN
        PRINT ' 5.BACK TO PREVIOUS MENU'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE BBA_BOOK1
        
        CMP AL,2
        JE BBA_BOOK2
        
        CMP AL,3
        JE BBA_BOOK3
        
        CMP AL,4
        JE BBA_BOOK4
        
        CMP AL,5
        JE OP_CATEGORY
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP BBA_BOOKS
            
            
            BBA_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        BBA_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' A History of Bangladesh By Willem van Schendel '
            PRINTN
            PRINT ' *** PRICE: 220TK ***'
            PRINTN
            
            MOV BX,220
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            BBA_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            BBA_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' Accounting Principles By Jerry J. Weygandt '
            PRINTN
            PRINT ' *** PRICE: 240TK ***'
            PRINTN
            
            MOV BX,240
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            BBA_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        BBA_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' Banking Law And Practice By P.N.Varshney '
            PRINTN
            PRINT ' *** PRICE: 220TK ***'
            PRINTN
            
            MOV BX,220
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            BBA_BOOK3 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            BBA_BOOK4 PROC
            
            PRINTN
            PRINTN
            PRINT ' Business And Commercial Law Study Manual '
            PRINTN
            PRINT ' *** PRICE: 170TK ***'
            PRINTN
            
            MOV BX,170
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            BBA_BOOK4 ENDP
;E----------------------------------------------------------- BBA END

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