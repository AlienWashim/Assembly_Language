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
        JE LOGIN
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
        MOV CX, 3
        
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
    
        MOV CX, 3
    
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
        PRINT ' 4.LOGOUT'
        PRINTN
        PRINTN
        PRINT ' CHOICE = '
    
        CALL SCAN_NUM
        MOV OP,CL
        
        MOV AL,OP
        
        CMP AL,1
        JE CALL OP_CATEGORY
        
        CMP AL,2
        JE CALL OP_VIEW_BALANCE
        
        CMP AL,3
        JE CALL OP_ADD_BALANCE
        
        CMP AL,4
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
        
        CMP AL,2
        JE EEE_BOOKS
        
        CMP AL,3
        JE TEXTILE_BOOKS
        
        CMP AL,4
        JE ENGLISH_BOOKS
        
        CMP AL,5
        JE BBB_BOOKS
        
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
        
        CMP AL,2
        JE JAVA_BOOKS
        
        CMP AL,3
        JE ALGORITHM_BOOKS
        
        CMP AL,4
        JE WEB_DEVELOPMENT_BOOKS
        
        CMP AL,5
        JE ASSEMBLY_BOOKS
        
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
            PRINT ' *** PRICE: 247TK ***'
            PRINTN
            
            MOV BX,247
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
            PRINT ' *** PRICE: 290TK ***'
            PRINTN
            
            MOV BX,290
            MOV PRICE,BX
            PRICE_CALCULATOR PRICE
            
            C_BOOK5 ENDP
;E----------------------------------------------------------- C END

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
        
        CMP AL,7
        JE S_OPTION
        
        
    
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
        
        CMP AL,5
        JE S_OPTION
        
        
    
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
        
        CMP AL,5
        JE S_OPTION
        
        
    
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