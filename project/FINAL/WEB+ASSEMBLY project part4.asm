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
        
        CMP AL,1
        JE CSE_BOOKS
    
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
        
        CMP AL,4
        JE WEB_DEVELOPMENT_BOOKS
        
        CMP AL,5
        JE ASSEMBLY_BOOKS
        
        CMP AL,6
        JE OP_CATEGORY
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP CSE_BOOKS
            
            
            CSE_BOOKS ENDP
;E-----------------------------------------------------------    


;S----------------------------------------------------------- WEB_DEVELOPMENT START
        WEB_DEVELOPMENT_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.HTML & CSS (Design and Build Websites) (B&W)             PRICE:350TK'
        PRINTN                                                             
        PRINT ' 2.Career Track: Front-End Web Development (JS)             PRICE:7000TK'
        PRINTN
        PRINT ' 3.JavaScript Cookbook Programming the Web (White Print)    PRICE:420TK'
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
        JE WEB_DEVELOPMENT_BOOK1
        
        CMP AL,2
        JE WEB_DEVELOPMENT_BOOK2
        
        CMP AL,3
        JE WEB_DEVELOPMENT_BOOK3
        
        CMP AL,4
        JE CSE_BOOKS
        
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP WEB_DEVELOPMENT_BOOKS
            
            
            WEB_DEVELOPMENT_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        WEB_DEVELOPMENT_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' HTML & CSS (Design and Build Websites) (B&W) '
            PRINTN
            PRINT ' *** PRICE: 350TK ***'
            PRINTN
            
            MOV BX,350
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            WEB_DEVELOPMENT_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            WEB_DEVELOPMENT_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' Career Track: Front-End Web Development (JS) '
            PRINTN
            PRINT ' *** PRICE: 7000TK ***'
            PRINTN
            
            MOV BX,7000
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            WEB_DEVELOPMENT_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        WEB_DEVELOPMENT_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' JavaScript Cookbook Programming the Web (White Print) '
            PRINTN
            PRINT ' *** PRICE: 420TK ***'
            PRINTN
            
            MOV BX,420
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            WEB_DEVELOPMENT_BOOK3 ENDP
;E----------------------------------------------------------- WEB_DEVELOPMENT END

;S----------------------------------------------------------- ASSEMBLY START
        ASSEMBLY_BOOKS PROC
            
        PRINTN
        PRINTN
        PRINT '*****.....CHOOSE BOOKS.....*****'
        PRINTN
        PRINTN
        PRINT ' 1.Assembly Language Programming and Organization of the IBM PC    PRICE:190TK'
        PRINTN                                                             
        PRINT ' 2.Assembly Language Programming and Organization of (eco)         PRICE:170TK'
        PRINTN
        PRINT ' 3.Asssembly Language Programming and Organization IBM Pc          PRICE:14280TK'
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
        JE ASSEMBLY_BOOK1
        
        CMP AL,2
        JE ASSEMBLY_BOOK2
        
        CMP AL,3
        JE ASSEMBLY_BOOK3
        
        CMP AL,4
        JE CSE_BOOKS
        
        CMP AL,5
        JE S_OPTION
        
        
    
        PRINTN
    
        PRINTN ' WRONG SELECTION!!!'
        PRINTN
    
        PRINTN
        
        JMP ASSEMBLY_BOOKS
            
            
            ASSEMBLY_BOOKS ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        ASSEMBLY_BOOK1 PROC
            
            PRINTN
            PRINTN
            PRINT ' Assembly Language Programming and Organization of the IBM PC '
            PRINTN
            PRINT ' *** PRICE: 190TK ***'
            PRINTN
            
            MOV BX,190
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ASSEMBLY_BOOK1 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------
            ASSEMBLY_BOOK2 PROC
            
            PRINTN
            PRINTN
            PRINT ' Assembly Language Programming and Organization of (eco) '
            PRINTN
            PRINT ' *** PRICE: 170TK ***'
            PRINTN
            
            MOV BX,170
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ASSEMBLY_BOOK2 ENDP
;E-----------------------------------------------------------

;S-----------------------------------------------------------        
        ASSEMBLY_BOOK3 PROC
            
            PRINTN
            PRINTN
            PRINT ' Asssembly Language Programming and Organization IBM Pc '
            PRINTN
            PRINT ' *** PRICE: 14280TK ***'
            PRINTN
            
            MOV BX,14280
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            ASSEMBLY_BOOK3 ENDP
;E----------------------------------------------------------- ASSEMBLY END

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