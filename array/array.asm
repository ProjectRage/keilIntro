
	AREA  ADDITION, CODE, READONLY 
 
ENTRY     					;Mark first instruction to execute 
 
START  
	MOV R5,#6    			; INTIALISE COUNTER TO 6(i.e. N=6)  
	MOV R0,#0    			; INTIALISE SUM TO ZERO   
	LDR R1,=VALUE1        	; LOADS THE ADDRESS OF FIRST VALUE 
LOOP  
	LDR R2,[R1],#2   		; WORD ALIGN To ARRAY ELEMENT  
	LDR R3,MASK    			; MASK To GET 16 BIT  
	AND R2,R2,R3   			; MASK MSB  
	ADD R0,R0,R2      		; ADD THE ELEMENTS  
	SUBS R5,R5,#1   		; DECREMENT COUNTER  
	CMP R5,#0    			;  
	BNE LOOP    			;  LOOK BACK TILL ARRAY ENDS 
 
	LDR R4,=RESULT     		; LOADS THE ADDRESS OF RESULT   
	STR R0,[R4]   			; STORES THE RESULT IN R1 
 
	NOP
	NOP  
	NOP 
 
MASK DCD 0X0000FFFF   ;  MASK MSB 
 
VALUE1 DCW 0X1111,0X2222,0X3333,0XAAAA,0XBBBB,0XCCCC 	;ARRAY OF 16BIT                                                                    
														;NUMBERS(N=6) 
 
	AREA DATA2, DATA, READWRITE  ; TO STORE RESULT IN GIVEN ADDRESS    
	
RESULT DCD 0X0     
 
	END    ; Mark end of file