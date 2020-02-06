#include <pic16f887.inc>
list p=16f887

	cblock 0x20
		led_cnt
	endc

	org 	0x00	;reset vector
	goto 	Start
	
	org 0x04		;interrupt vector
	retfie			; sai da interrup��o
	
	Start:			;r�tulo start
		;--------I/O config ---------
		bsf 	STATUS, RP0	;change to bank1
		movlw	B'11110000'
		movwf 	TRISA			; config RA0-R3 as output
								; and RA4-RA7 as input
		bsf 	STATUS, RP1		; change to bank3
		clrf	ANSEL			; configure PORTA as, comando clrf = tudo vira 0						
								; digital input
								
	Main:
		goto	RotinaInicializacao
		
	RotinaInicializacao:
		bcf		STATUS, RP1
		bcf		STATUS, RP0		; change to bank0
		movlw	0x0F			; set pins RA0-RA3
		movwf	PORTA			; set p�ns RA0-RA3
		call 	Delay_1s		; call delay function
		clrf	PORTA			; reset pins RA0-RA3
		
		
	
	
	
	

