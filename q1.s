     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	q1
	    ;MOV  R0, #0x1
		;MOV  R1, #0x5
		;EOR R0, R0, R1; R0 XOR R1
		;EOR R1, R0, R1; R1 XOR R0
		;EOR R0, R0, R1; R0 XOR R1
		;MOV R0, #1		;POWER OF EXPONENTIAL
		;MOV R1, #10	;NUMBER OF TERMS TAKEN FOR SUMMATION
		VLDR.F32 S0, =14.0	;i power of exponential(x)
		VLDR.F32 S1, =10.0	;j number of terms in the series
		MOV R1, #10		; number of times it will loop
		VLDR.F32 S3, =0.0	;COUNTER K
		MOV R3, #0		;counter
		VLDR.F32 S4, =0.0	;******SUM(output e^x)*********
		VLDR.F32 S5, =1.0	;DENom
		VLDR.F32 S6, =1.0	;ii
		VLDR.F32 S7, =0.0 	;ii/DEN
		VLDR.F32 S8, =1.0	;#1
		
	
COMP    CMP R3,R1			;counter runs r1 times
		BLT LOOP
		BEQ stop
		BGE stop

LOOP	VDIV.F32 S7,S6,S5	;II/DEN
		VADD.F32 S4,S4,S7	;SUM*****(outpute^x)*****
		VMUL.F32 S6,S6,S0	;II	
		VADD.F32 S3,S3,S8	;
		VMUL.F32 S5,S5,S3	;DEN
		ADD R3,R3,#1
		B COMP
		
		
		
stop    B stop ; stop program
     ENDFUNC
     END 
