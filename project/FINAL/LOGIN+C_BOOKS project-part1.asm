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
    MOV [SI],AX
    INC SI
    ADD COUNTER,1
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
    MOV TOTAL,0
    MOV [SI],AX
    INC SI
    ADD COUNTER,1
    JMP S_OPTION 
    
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
.MODEL SMALL
.STACK 100H
.DATA
    USER DB 'WASHIM'
    PWD DB 'SHARMIN'
    OP DB ?
    BALANCE DW 0
    QUANTITY DW ?
    COST DW 0
    DIS DW ?
    PRICE DW ?
    PAY DW ?
    TOTAL DW 0
    HISTORY DW ?
    COUNTER DW 0

.CODE
MAIN PROC
    ROOT:
    MOV AX, @DATA
    MOV DS, AX
    
    MOV SI, OFFSET HISTORY
    
    CALL F_OPTION
    
    
    
    EXIT:
    PRINTN
    PRINTN 'EXIT DONE'
    MOV AH,4CH
    INT 21H 
    
    MAIN ENDP

    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
    
    F_OPTION PROC
           
        FIRST_OPTION:
        MOV TOTAL,0
        MOV HISTORY,0
        MOV COUNTER,0
        PRINTN
        PRINT '*****.....PLEASE LOGIN TO ACCESS LIBRARY.....*****'
        PRINTN
        PRINT ' 1.LOGIN'
        PRINTN
 
        PRINT ' 2.EXIT'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL

    
        PRINTN
    
        MOV AL,OP
        CMP AL,1
        JE CALL LOGIN
        CMP AL,2
        JE EXIT
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
        JMP FIRST_OPTION
        
        F_OPTION ENDP
    
    
    LOGIN PROC
        
        ;----------------------------USERNAME CHECK START
        MOV BX, OFFSET USER
        MOV CX, 6
        
        PRINTN
        PRINT ' ENTER YOUR USERNAME: '
        X1: 
        MOV AH, 8
        INT 21H
    
        PUSH AX
        PUSH [BX]
        INC BX
    
        PRINT '*'
    
        LOOP X1
    
        MOV CX, 6
    
        Y1: 
        POP AX
        POP BX
        CMP BL, AL
        JNE ERROR
        LOOP Y1
        ;-------------------------------USERNAME CHECKED
        
        ;----------------------------PASS CHECK START
        MOV BX, OFFSET PWD
        MOV CX, 7
        
        PRINTN
        PRINT ' ENTER YOUR PASSWORD: '
        X2: 
        MOV AH, 8
        INT 21H
    
        PUSH AX
        PUSH [BX]
        INC BX
    
        PRINT '*'
    
        LOOP X2
    
        MOV CX, 7
    
        Y2: 
        POP AX
        POP BX
        CMP BL, AL
        JNE ERROR
        LOOP Y2
        ;-------------------------------PASS CHECKED
    
        
        PRINTN
        PRINTN
        PRINTN ' .....LOGGED IN SUCCESSFULY.....'
        PRINTN
        JMP S_OPTION
    
        ERROR: 
        PRINTN
        PRINTN
        PRINT ' TRY AGAIN'
        PRINTN
        PRINTN
        CALL LOGIN
        JMP ROOT
        
        LOGIN ENDP

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
        PRINT ' 4.HISTORY'
        PRINTN
        PRINT ' 5.LOGOUT'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE OP_CATEGORY
        
        CMP AL,2
        JE OP_VIEW_BALANCE
        
        CMP AL,3
        JE OP_ADD_BALANCE
        
        CMP AL,4
        JE SHOW_HISTORY
        
        CMP AL,5
        JE FIRST_OPTION
    
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
    
;S---------------------------------------------------------
    OP_VIEW_BALANCE PROC
        
        PRINTN
        PRINT ' YOUR CURRENT BALANCE IS: '
        MOV AX,BALANCE
        CALL PRINT_NUM
        PRINTN
        CALL S_OPTION
        
        OP_VIEW_BALANCE ENDP
;E-----------------------------------------------------------
    
;S-----------------------------------------------------------
    OP_ADD_BALANCE PROC
        
        PRINTN
        PRINTN
        PRINT ' ENTER AMOUNT: '
        CALL SCAN_NUM
        ADD BALANCE,CX
        PRINTN
        PRINTN ' BALANCE ADDED SUCCESSFULLY'
        PRINT ' YOUR CURRENT BALANCE IS: '
        MOV AX,BALANCE
        CALL PRINT_NUM
        PRINTN
        CALL S_OPTION
        
        OP_ADD_BALANCE ENDP
;E-----------------------------------------------------------

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
        
        CMP AL,1
        JE C_BOOKS
        
        
        CMP AL,6
        JE OP_CATEGORY
        
        CMP AL,7
        JE S_OPTION
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP CSE_BOOKS
            
            
            CSE_BOOKS ENDP
;E-----------------------------------------------------------    

;S----------------------------------------------------------- C START
        C_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.C Programming By Jakir Hossain                               PRICE:249TK'
        PRINTN
        PRINT ' 2.Programming In ANSI C (Eighth Edition) by E - Balagurusamy   PRICE:520TK'
        PRINTN
        PRINT ' 3.Programming With C by Byron Gottfried                        PRICE:265TK'
        PRINTN
        PRINT ' 4.Object-Oriented Programming With C++ by E - Balagurusamy     PRICE:246TK'
        PRINTN
        PRINT ' 5.Programming Contest Data Structure and Algorithm             PRICE:300TK'
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
        
        CMP AL,1
        JE C_BOOK1
        
        CMP AL,2
        JE C_BOOK2
        
        CMP AL,3
        JE C_BOOK3
        
        CMP AL,4
        JE C_BOOK4
        
        CMP AL,5
        JE C_BOOK5
        
        CMP AL,6
        JE CSE_BOOKS
        
        CMP AL,7
        JE S_OPTION
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP C_BOOKS
            
            
            C_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        C_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' C Programming By Jakir Hossain '
            PRINTN
            PRINT ' *** PRICE: 249TK ***'
            PRINTN
            
            MOV BX,249
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            C_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            C_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' Programming In ANSI C (Eighth Edition) by E - Balagurusamy '
            PRINTN
            PRINT ' *** PRICE: 520TK ***'
            PRINTN
            
            MOV BX,520
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            C_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        C_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' Programming With C by Byron Gottfried '
            PRINTN
            PRINT ' *** PRICE: 265TK ***'
            PRINTN
            
            MOV BX,265
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            C_BOOK3 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            C_BOOK4 PROC
            
            PRINTN
            PRINTN
            PRINT ' Object-Oriented Programming With C++ by E - Balagurusamy '
            PRINTN
            PRINT ' *** PRICE: 246TK ***'
            PRINTN
            
            MOV BX,246
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            C_BOOK4 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            C_BOOK5 PROC
            
            PRINTN
            PRINTN
            PRINT ' Programming Contest Data Structure and Algorithm '
            PRINTN
            PRINT ' *** PRICE: 300TK ***'
            PRINTN
            
            MOV BX,300
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            C_BOOK5 ENDP
;E----------------------------------------------------------- C END

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
    CALL SCAN_NUM
    MOV AL,CL
    
    CMP AL,1
    JE OP_CATEGORY
        
    CMP AL,2
    JE PAY_BILL
    
    PRINTN
    PRINTN ' WRONG SELECTIN'
    PRINTN
    
    JMP CONTINUE
    
    PAY_BILL:
    PAYMENT TOTAL   ;MACRO CALL
    
    CONTINUE ENDP
;E----------------------------------------------------------- 

;S-----------------------------------------------------------HISTORY PRINT START   
    SHOW_HISTORY PROC
        
        MOV BX, OFFSET HISTORY
        MOV CX,COUNTER
        PRINTN
        PRINT 'LAST PURCHASE: ' 
        
        SHOW:
        MOV AX,[BX]
        CALL PRINT_NUM
        PRINT 'TK, '
        INC BX
        LOOP SHOW
        
        JMP S_OP
        
        SHOW_HISTORY ENDP    
;S----------------------------------------------------------- HISTORY PRINT END
    
END MAIN