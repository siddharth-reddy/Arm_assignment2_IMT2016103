     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	   ; MOV  R0, #0x1
		;MOV  R1, #0x5
		;EOR R0, R0, R1; R0 XOR R1
		;EOR R1, R0, R1; R1 XOR R0
		;EOR R0, R0, R1; R0 XOR R1  
		;--------------Q2
		VLDR.F32 S0, =4.72	;input value of x in tanx (in radians)
		VLDR.F32 S1, =20.0	;
		MOV R1, #10		;j (no of terms considered in the series)
		VLDR.F32 S3, =0.0	;COUNTER K
		MOV R3, #0		;counter for loop
		VLDR.F32 S4, =0.0	;SUM (*****you get cosx here*** )
		VLDR.F32 S5, =1.0	;DEN
		VLDR.F32 S6, =1.0	;ii
		VLDR.F32 S7, =0.0 	;ii/DEN
		VLDR.F32 S8, =1.0	;#1
		VLDR.F32 S9, =0.0	;SUM2 (*****you get sinx here****)
		VLDR.F32 S10, =0.0	;TAN(**output tanx****)
		VLDR.F32 S11, =1.0	;-VE SIGN
		VLDR.F32 S12, =-1.0	;-VE SIGN
	
COMP    CMP R3,R1			;loop runs j times(i.e number of terms in the series)
		BLT LOOP
		VDIV.F32 S10,S9,S4	;TANx DIVIDE(sinx/cosx)
		BEQ stop
		BGE stop

LOOP	VDIV.F32 S7,S6,S5	;II/DEN		loop to calculate cosx
		VMUL.F32 S7,S7,S11	;SIGN
		VADD.F32 S4,S4,S7	;SUM1---cosx---
		VMUL.F32 S6,S6,S0	;II	
		VADD.F32 S3,S3,S8	;
		VMUL.F32 S5,S5,S3	;DEN
		ADD R3,R3,#1
		B LOOP1

LOOP1	VDIV.F32 S7,S6,S5	;II/DEN		loop to calculate sinx
		VMUL.F32 S7,S7,S11	;SIGN
		VADD.F32 S9,S9,S7	;SUM2---sinx---
		VMUL.F32 S6,S6,S0	;II	
		VADD.F32 S3,S3,S8	;
		VMUL.F32 S5,S5,S3	;DEN
		ADD R3,R3,#1
		VMUL.F32 S11,S11,S12	; CHANGINg the sign 
		
		B COMP
		
		
stop    B stop ; stop program
     ENDFUNC
     END 
