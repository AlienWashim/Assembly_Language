FOURTY_QUANTITY MACRO 
    SUB AL,48
   
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    JMP BACK_TO_FOURTY
    FOURTY_QUANTITY ENDM

.MODEL LARGE
.STACK 1000H
.DATA
M1 DB 10,13,10,13,'                 ****Welcome to Our Restaurants****$',10,13 
M2 DB 10,13,10,13,'Enter your Choise $'

M3 DB 10,13,'  **                 1.Breakfast Menue         **$' 
M4 DB 10,13,'  **                 2.Lunch Menue             **$'
M5 DB 10,13,'  **                 3.Dinner Menue            **$'
 
                              
M6 DB 10,13,10,13,'***Choise your food from the menu***$'
  
;BREAKFAST  
M7 DB 10,13,'   **           1.Tanduri Roti            10/-                      **$' ;breakfast
M8 DB 10,13,'   **           2.Nan                     10/-                      **$'
M9 DB 10,13,'   **           3.Parata                  10/-                      **$'
M10 DB 10,13,'  **           4.Dal                     10/-                      **$'
M11 DB 10,13,'  **           5.Mixed Vegetables        20/-                      **$'
M12 DB 10,13,'  **           6.Halwa                   20/-                      **$'
M13 DB 10,13,'  **           7.Luchi                   10/-                      **$'
M14 DB 10,13,'  **           8.Fried Egg               20/-                      **$'
M15 DB 10,13,'  **           9.Goats Feet              60/-                      **$' 

 

;lunch & dinner 

M16 DB 10,13,'  **  1.Kachchi Birani(Kabab+Egg)              90/-                **$' 
M17 DB 10,13,'  **  2.Chicken Birani(Kabab+Egg)              90/-                **$' 
M27 DB 10,13,'  **  3.Plain Polaw                            30/-                **$' 
M30 DB 10,13,'  **  5.Plain Rice                             10/-                **$'
M31 DB 10,13,'  **  6.Pabda Fish                             30/-                **$'
M33 DB 10,13,'  **  7.Koi Fish                               30/-                **$'
 

;DINNER

M18 DB 10,13,'  **  1.Goats Brain             60/-                               **$'
M19 DB 10,13,'  **  2.Chicken Bhuna Khichuri  80/-                               **$'
M20 DB 10,13,'  **  3.Mutton Bhuna Khichuri   80/-                               **$' 
M21 DB 10,13,'  **  4.Chicken Liver/Kolija    40/-                               **$'
M22 DB 10,13,'  **  5.Goats Liver/Kolija      50/-                               **$'
M23 DB 10,13,'  **  6.Chicken Vuna            70/-                               **$'
M24 DB 10,13,'  **  7.Hilsha Fish             60/-                               **$'
M35 DB 10,13,'  **  8.Rui Fish                60/-                               **$'


;INVALID
M55 DB 10,13,10,13,'***&&INVALID ENTRY&&***$'
M56 DB 10,13,'      ***&&Try Again&&***$'



M57 DB 10,13,10,13,'Enter your order: $'
M58 DB 10,13,'Quantity: $'
M59 DB 10,13,'Total Price: $'




M60 DB 10,13,10,13,'1.Go Back to Main Menu$'
M61 DB 10,13,'2.EXIT$'

;STAR RESIZE




SEJ DB 10,13,10,13,' $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    CALL TOP
 
      
   FOURTY:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 

    MOV AH,1
    INT 21H
    FOURTY_QUANTITY AL
    
    BACK_TO_FOURTY:
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48

    CMP AL,1
    JE TOP
    
    JMP EXIT
             
   FIFTY:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
 
    
    MOV AH,1
    INT 21H
    SUB AL,48

    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
  
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H

    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48    ;MAIN  MENU

    CMP AL,1
    JE TOP
    
    JMP EXIT
             
   SEVENTY:
    MOV BL,7
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H       ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48
  
    CMP AL,1
    JE TOP
    
    JMP EXIT
         
   EIGHTY:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
  
    MOV AH,1
    INT 21H
    SUB AL,48
 
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2    ;MAIN MENU
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
   
    CMP AL,1
    JE TOP
    
    JMP EXIT         
    
    JMP EXIT

    CALL LD
    
   TEN:
    MOV BL,1
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H  
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
     
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H          
    SUB AL,48
   
    CMP AL,1
    JE TOP
    
    JMP EXIT
 
    
   TWENTY:
   
    MOV BL,2
    LEA DX,M58              
    MOV AH,9
    INT 21H 
  
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    CMP AL,1
    JE TOP
    
    JMP EXIT 
    
   THIRTY:
   
    MOV BL,3
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
   
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H  
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    
    
    CMP AL,1
    JE TOP
    
    JMP EXIT
    
    
   SIXTY: 
   
    MOV BL,6
   
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
  
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
   
    CMP AL,1
    JE TOP
    
    JMP EXIT
    
      
   NINETY:
    MOV BL,9
    
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H 
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
  
    CMP AL,1
    JE TOP
    
    JMP EXIT 
  
    JMP EXIT 
   
  
    
   FOURTY1:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    CMP AL,1
    JE TOP
    
    JMP EXIT

  FIFTY1:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
 
    MOV AH,1
    INT 21H
    SUB AL,48
  
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
           
           
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48    ;MAIN  MENU
   
    CMP AL,1
    JE TOP
    
    JMP EXIT

   SIXTY1: 
   
    MOV BL,6
   
    LEA DX,M58              
    MOV AH,9
    INT 21H 
  
    MOV AH,1
    INT 21H
    SUB AL,48
 
    
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H             ;MAIN MENU
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
 
    CMP AL,1
    JE TOP
    
    JMP EXIT 

   SEVENTY1:
    MOV BL,7
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
   
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H 
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU 
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H       ;MAIN MENU
    
    MOV AH,1
    INT 21H
    SUB AL,48
 
    CMP AL,1
    JE TOP
    
    JMP EXIT
         
   EIGHTY1:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
   
    MOV AH,1
    INT 21H
    SUB AL,48
   
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
   
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2    ;MAIN MENU
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
   
    CMP AL,1
    JE TOP
    
    JMP EXIT         
    
    JMP EXIT
 
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE L1
    
    CMP BL,2
    JE L2
    
    CMP BL,3
    JE L3
    
    CMP BL,4
    JE L3
    
    JMP INVALID
  
   L1: 
    MOV BL,8
    JMP L4
   
   L2:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
   
    MOV AH,1
    INT 21H
    SUB AL,48
  
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
   
    CMP AL,1
    JE TOP
    
    JMP EXIT 
 
   L3:
   MOV BL,5
   JMP L4 
   
   
   L4:
    LEA DX,M58              
    MOV AH,9
    INT 21H 
  
    MOV AH,1
    INT 21H
    SUB AL,48
  
    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
 
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    
    MOV DL,CL
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
 
    ;GO BACK TO MAIN MENU
 
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
 
    
    CMP AL,1
    JE TOP

    JMP EXIT

    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
     
    CMP BL,4
    JG INVALID
    
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    
    XOR BL,BL
    MOV BL,5
    
    MOV AH,1
    INT 21H
    SUB AL,48

    MUL BL 
    AAM 
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    LEA DX,M59              
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    MOV DL,CL
    INT 21H
    
    MOV DL,'0'
    INT 21H
    
    ;FOR /- PRINT
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    
    ;GO BACK TO MAIN MENU
    
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    LEA DX,M61
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48

    
    CMP AL,1
    JE TOP

    JMP EXIT
   
     
   
    
     EXIT:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    
    TOP PROC
  
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H

    

    LEA DX,M3
    MOV AH,9
    INT 21H
    
    LEA DX,M4
    MOV AH,9
    INT 21H
    
    LEA DX,M5
    MOV AH,9
    INT 21H

    LEA DX,M2
    MOV AH,9
    INT 21H

    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    JE BREAKFAST
    
    CMP BH,2
    JE LD   
     
    CMP BH,3
    JE DINNER 
   
    
    JMP INVALID
        TOP ENDP
    
    BREAKFAST PROC
    
    LEA DX,M6    ;BREATFAST STARTS
    MOV AH,9
    INT 21H
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H

   
    LEA DX,M7    ;item 1
    MOV AH,9
    INT 21H 
    
    
    LEA DX,M8  ;item 2
    MOV AH,9
    INT 21H
    
    LEA DX,M9
    MOV AH,9          ;3nd
    INT 21H 
    
    LEA DX,M10
    MOV AH,9           ;4rd
    INT 21H
    
    
    LEA DX,M11         ;5th
    MOV AH,9
    INT 21H
    
    
    LEA DX,M12    ;6th
    MOV AH,9
    INT 21H
            
    
    LEA DX,M13
    MOV AH,9           ;7th
    INT 21H
            
            
    LEA DX,M14        ;8th
    MOV AH,9
    INT 21H 
    
    LEA DX,M15        ;9th
    MOV AH,9
    INT 21H

    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE TEN
    
    CMP BL,2
    JE TEN
    
    CMP BL,3
    JE TEN 
    
    CMP BL,4
    JE TEN
    
    CMP BL,5
    JE TWENTY
    
    CMP BL,6
    JE TWENTY
    
    CMP BL,7
    JE TEN
    
    CMP BL,8
    JE TWENTY 
    
    CMP BL,9
    JE SIXTY
  
    JMP INVALID
        BREAKFAST ENDP
    
    LD PROC
                    ;LUNCH AND DINNER
    LEA DX,M6
    MOV AH,9
    INT 21H
    
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
     
    
    LEA DX,M16               ;1th
    MOV AH,9
    INT 21H 
    
    LEA DX,M17               ;2th
    MOV AH,9
    INT 21H
    
    LEA DX,M27               ;3rd
    MOV AH,9
    INT 21H  

    LEA DX,M30               ;6th
    MOV AH,9
    INT 21H 
    
    LEA DX,M31               ;7th
    MOV AH,9
    INT 21H 

    LEA DX,M33               ;9th
    MOV AH,9
    INT 21H
    

    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE NINETY
    
    CMP BL,2
    JE NINETY
    
    CMP BL,3
    JE THIRTY
    
    CMP BL,4
    JE NINETY
    
    CMP BL,5
    JE NINETY
    
    CMP BL,6
    JE TEN
    
    CMP BL,7
    JE THIRTY
    
    CMP BL,8
    JE THIRTY 
    
    CMP BL,9
    JE THIRTY


    JMP INVALID
        LD ENDP
    
    DINNER PROC
    LEA DX,M6
    MOV AH,9         ;DINNER STARTS
    INT 21H
    
    LEA DX,SEJ ;NEWLINE
    MOV AH,9
    INT 21H
    

    
    LEA DX,M18         ;1th
    MOV AH,9
    INT 21H 
    
    LEA DX,M19
    MOV AH,9              ;12th
    INT 21H
    
    
    LEA DX,M20          ;3th
    MOV AH,9
    INT 21H
    
    LEA DX,M21
    MOV AH,9                ;4th
    INT 21H  
    
    LEA DX,M22              ;5th
    MOV AH,9
    INT 21H 
    
    LEA DX,M23               ;6th
    MOV AH,9
    INT 21H
    
    LEA DX,M24               ;10th
    MOV AH,9
    INT 21H
    
    LEA DX,M35               ;11th
    MOV AH,9
    INT 21H 

    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE SIXTY
    
    CMP BL,2
    JE EIGHTY
    
    CMP BL,3
    JE EIGHTY 
    
    CMP BL,4
    JE FOURTY
    
    CMP BL,5
    JE FIFTY
    
    CMP BL,6
    JE SEVENTY
    
    CMP BL,7
    JE SIXTY
    
    CMP BL,8
    JE SIXTY 
    
    CMP BL,9
    JE SIXTY
    
    JMP EXIT
        DINNER ENDP
    
    INVALID PROC
        LEA DX,M55
        MOV AH,9
        INT 21H 
    
    
        LEA DX,M56 
        MOV AH,9
        INT 21H 
    

        JMP EXIT
        
        INVALID ENDP
    
END MAIN