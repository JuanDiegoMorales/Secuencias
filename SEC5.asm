; PIC16F887 Configuration Bit Settings

; Assembly source line config statements

   
#include "p16f887.inc"

; CONFIG1
; __config 0x28D5
 __CONFIG _CONFIG1, _FOSC_INTRC_CLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOREN_OFF & _IESO_OFF & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

    
    LIST p=16F887
    
N EQU 0xD0
cont1 EQU 0x20 
cont2 EQU 0x21 
cont3 EQU 0x22 
 
 
    ORG	0x00
    GOTO INICIO
    
INICIO
    BCF STATUS,RP0   ;RP0 = 0
    BCF STATUS,RP1  ;RP1 = 0
    CLRF PORTA ;PORTA = 0
    CLRF PORTB;PORT SECUENCIA LED
    ;MOVLW B'0000000'  ;
    ;MOVWF PORTA
    BSF STATUS, RP0 ;RP0 = 1
    CLRF TRISA
    CLRF TRISB ;SECUENCIA SALIDA
    BSF STATUS,RP1
    CLRF ANSELH
    BCF STATUS,RP0  ;BANK O RP1=0 RP0=0
    BCF STATUS,RP1


    MOVLW 0x01
    MOVWF PORTB
LOOP1
    RLF PORTB
    CALL RETARDO
    BTFSS STATUS,0
    GOTO LOOP1
 
    BCF STATUS,0
    MOVLW 0x80
    MOVWF PORTB
   
LOOP2
    RRF PORTB
    CALL RETARDO
    BTFSS STATUS,0
    GOTO LOOP2
   
    BCF STATUS,0
    MOVLW 0xF0
    MOVWF PORTB
   
   
LOOP4
    SWAPF PORTB
    CALL RETARDO
    BTFSS PORTD,7
    GOTO LOOP4
    
LOOP7
    MOVLW 0xA1
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    MOVLW 0x52
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    MOVLW 0xA4
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    MOVLW 0x58
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    MOVLW 0xA8
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    MOVLW 0x54
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    MOVLW 0xA2
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    MOVLW 0x51
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    BTFSS PORTB,0
    GOTO LOOP7
   
   
    MOVLW 0x01
    MOVWF PORTB
    
    
LOOP6
    RLF PORTB
    BSF PORTB, 0
    CALL RETARDO
    CALL RETARDO
    BTFSS PORTB,7
    GOTO LOOP6
    
    CALL RETARDO 
    CALL RETARDO
    GOTO LOOP1

RETARDO
    MOVLW N
    MOVWF cont1
    
REP_1
    MOVLW N
    MOVWF cont2
    
REP_2
    DECFSZ cont2,1
    GOTO REP_2
    DECFSZ cont1,1
    GOTO REP_1
    RETURN
    
    END




